require './valera'
require './game'
require './output_save'
require './input_save'

class App
  def initialize
    @valera = Valera.new
    @game = Game.new
    @output_save = OutputSave.new
    @input_save = InputSave.new
  end

  def main
    puts 'Меню:'
    puts '1 - Начать новую игру'
    puts '2 - Продолжить игру'
    puts '3 - выйти из игры'
    input_item_menu = gets.to_i
    case input_item_menu
    when 1
    when 2
      @input_save.read(@valera)
      @game.start(@valera)
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

  def print_regulations
    File.open('./regulations.txt', 'r').each do |line|
      puts line
    end
  end
end

app = App.new
app.start
