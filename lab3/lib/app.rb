require './valera'
require './game'
require './output_save'
require './input_save'
require './output_interface'
require './constants/path_constants'

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
    stats = InputSave.load_json(STATS_JSON)
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
    action_config = InputSave.load_json(ACTION_JSON)
    boundaries = InputSave.load_json(BOUNDARIES_JSON)
    death_state = InputSave.load_json(DEATH_STATE_JSON)
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
