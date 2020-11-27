require './valera'
require 'colorize'

class Game
  def enter_action(valera, action)
    case action
    when 1
      valera.work
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
  end

  def print_regulations
    File.open('./regulations.txt', 'r').each do |line|
      puts line
    end
  end

  def select_regulation
    number_action = 0
    loop do
      print_regulations
      number_action = gets.to_i
      break if number_action.positive? && number_action < 10

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

  def print_regulations
    File.open('./regulations.txt', 'r').each do |line|
      if line[0] == '['
        puts line.chop.red
      else
        puts line
      end
    end
  end

  def start(valera)
    loop do
      puts `clear`
      print_stat(valera)
      action = select_regulation
      enter_action(valera, action)
      break if action == 9
    end
  end
end
