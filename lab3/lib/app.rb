require './valera'
require './game'
require './output_save'
require './input_save'

class App
  def initialize
    @game = Game.new
    @output_save = OutputSave.new
    @input_save = InputSave.new
  end

  def print_menu
    puts 'Меню:'
    puts '1 - Начать новую игру'
    puts '2 - Продолжить игру'
    puts '3 - выйти из игры'
  end

  def main
    print_menu
    input_item_menu = gets.to_i
    case input_item_menu
    when 1
      valera = @input_save.initialConfig
      @output_save.save(valera.stat)
      @game.start(valera)
    when 2
      valera = @input_save.read
      @game.start(valera)
    when 3
      exit
    end

    input_item_menu
  end

  def start
    puts 'Добро пожаловать в игру!'
    loop do
      input_item_menu = main
      break if input_item_menu == 3
    end
  end
end

app = App.new
app.start
