require './valera'
require './game'
require './output_save'
require './input_save'
require './output_module'

class App
  include Output

  def initialize
    @game = Game.new
    @output_save = OutputSave.new
    @input_save = InputSave.new
  end


  def main
    print_menu
    input_item_menu = gets.to_i
    case input_item_menu
    when 1

    when 2
      valera = @input_save.read
      @game.start(valera)
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
