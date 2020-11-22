require './io_files'
require './valera'
require './game'

class App
  def initialize
    @io_files = IOFiles.new
    @valera = Valera.new
    @game = Game.new
  end

  def main
    puts 'Меню:'
    puts '1 - Начать новую игру'
    puts '2 - Продолжить игру'
    puts '3 - Посмотреть правила игры'
    puts 'q - выйти из игры'
    input_item_menu = gets.chomp
    case input_item_menu
    when '1'
      @io_files.new_file
    when '2'
      @io_files.open_file(@valera)
      @game.start(@valera)
    when '3'
      @io_files.print_regulations
    when 'q'
      exit
    end

    input_item_menu
  end

  def start
    puts 'Добро пожаловать в игру!'
    loop do
      input_item_menu = main
      break if input_item_menu == 'q'
    end
  end
end

app = App.new
app.start
