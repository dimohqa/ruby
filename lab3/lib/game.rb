require './valera'

class Game
  def enter_action(valera)
    print_stat(valera)
    action = select_regulation
    case action
    when 1
      puts valera.health
    when 2
      valera.nature
    when 3
      valera.vine_serial
    when 4
      valera.bar
    when 5
      valera.drink
    when 6
      valera.sing
    when 7
      valera.sleep
    end

    action
  end

  def print_regulations
    puts 'Выберите следующее действие Валеры: '
    puts '1 - Пойти на работу'
    puts '2 - Созерцать природу'
    puts '3 - Пить вино и смотреть сериал'
    puts '4 - Сходить в бар'
    puts '5 - Выпить с маргинальными личностями'
    puts '6 - Петь в метро'
    puts '7 - Спать'
    puts '8 - Сохранить игру'
    puts '9 - закончить игру'
  end

  def select_regulation
    number_action = 0
    loop do
      print_regulations
      number_action = gets.to_i
      break if number_action > 0 && number_action < 10

      puts 'Выберите число от 1 до 9!'
    end
    number_action
  end

  def print_stat(valera)
    puts "health: #{valera.health}"
    puts "fun: #{valera.fun}"
    puts "fatigue: #{valera.fatigue}"
    puts "mana: #{valera.mana}"
    puts "money: #{valera.money}"
  end

  def start(valera)
    loop do
      puts `clear`
      number_action = enter_action(valera)
      break if number_action == 9
    end
  end
end
