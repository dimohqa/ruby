require './valera'
require './helpers/regulations'

class Game
  def enter_action
    print_regulations
    puts 'Выберите следующее действие Валеры: '
    number_action = gets.chomp
    case number_action
    when 1
      @valera.go_to_work
    when 2
      @valera.go_to_bar
    end

    number_action
  end

  def start(valera)
    @valera = valera
    loop do
      number_action = enter_action
      break if number_action == 'q'
    end
  end
end
