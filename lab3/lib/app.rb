require './valera'
require './game'
require './output_save'
require './input_save'
require './output_interface'

class App
  def main
    OutputInterface.print_menu
    input_item_menu = gets.to_i
    case input_item_menu
    when 1
      new_game
    when 2
      continue_game
    when 3
      OutputInterface.clear_screen
      exit
    else
      print_choose_number(1, 3)
    end

    input_item_menu
  end

  def new_game
    stats = InputSave.initial_config
    valera = initial_valera(stats)
    save_name = OutputSave.enter_save_name
    game = Game.new(valera)
    game.start(save_name)
  end

  def continue_game
    save_name = InputSave.select_save
    stats = InputSave.read(save_name)
    valera = initial_valera(stats)
    game = Game.new(valera)
    game.start(save_name)
  end

  def initial_valera(stats)
    action_config = InputSave.load_action_config
    boundaries = InputSave.load_boundaries
    death_state = InputSave.load_death_state
    Valera.new(stats, action_config, boundaries, death_state)
  end

  def start
    OutputInterface.clear_screen
    OutputInterface.print_welcome
    loop do |i|
      OutputInterface.clear_screen if i != 0
      input_item_menu = main
      break if input_item_menu == 3
    end
  end
end

app = App.new
app.start
