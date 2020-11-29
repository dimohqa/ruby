require './valera'
require './output_interface'
require './output_save'

class Game
  def initialize(valera)
    @valera = valera
  end

  @actions = {
    1 => ->(valera) { valera.work },
    2 => ->(valera) { valera.nature },
    3 => ->(valera) { valera.alcohol_action('vine_serial') },
    4 => ->(valera) { valera.alcohol_action('bar') },
    5 => ->(valera) { valera.alcohol_action('drink') },
    6 => ->(valera) { valera.song },
    7 => ->(valera) { valera.sleep }
  }

  class << self
    attr_reader :actions
  end

  def select_regulation
    number_action = 0
    OutputInterface.print_regulations
    loop do
      number_action = gets.to_i
      break if number_action.positive? && number_action < 10

      OutputInterface.print_choose_number(1, 8)
    end
    number_action
  end

  def start(save_name)
    loop do
      OutputInterface.clear_screen
      OutputInterface.print_cap(@valera.state)
      OutputSave.save(@valera.state, save_name)
      action = select_regulation
      break if action == 8

      Game.actions[action].call(@valera)
      OutputInterface.set_death_message if @valera.death?
    end
  end
end
