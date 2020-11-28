require './valera'
require './game'
require './output_save'
require './input_save'
require './output_module'

class App
  include Output

  def initialize
    @game = Game.new
  end

  def main
    print_menu
    input_item_menu = gets.to_i
    case input_item_menu
    when 1
      valera = InputSave.initial_config
      save_name = OutputSave.enter_save_name
      @game.start(valera, save_name)
    when 2
      save_name = InputSave.select_save
      valera = InputSave.read(save_name)
      @game.start(valera, save_name)
    when 3
      clear_screen
      exit
    end

    input_item_menu
  end

  def start
    print_welcome
    loop do
      input_item_menu = main
      break if input_item_menu == 3
    end
  end
end

app = App.new
app.start
