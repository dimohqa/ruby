require 'colorize'
require './string_constant'

module Output
  def initialize
    @@welcome = false
    @@message = VOID_MESSAGE
  end

  def print_menu
    clear_screen unless @@welcome
    @@welcome = false
    puts 'Меню:'
    puts '1 - Начать новую игру'
    puts '2 - Продолжить игру'
    puts '3 - выйти из игры'
  end

  def print_welcome
    clear_screen
    puts 'Добро пожаловать в игру!'
    @@welcome = true
  end

  def print_regulations
    File.open('./regulations.txt', 'r').each do |line|
      if line[0] == '['
        puts line.chop.yellow
      else
        puts line
      end
    end
  end

  def print_choose_number
    puts 'Выберите число от 1 до 9!'.red
  end

  def print_stats(stats)
    puts "health: #{stats['health']}"
    puts "fun: #{stats['fun']}"
    puts "fatigue: #{stats['fatigue']}"
    puts "mana: #{stats['mana']}"
    puts "money: #{stats['money']}"
  end

  def set_void_message
    @@message = VOID_MESSAGE
  end

  def set_work_error
    @@message = WORK_ERROR
  end

  def set_money_error
    @@message = MONEY_ERROR
  end

  def set_death_message
    @@message = DEATH_MESSAGE
  end

  def print_message
    clear_screen
    puts @@message.red
    set_void_message
  end

  def print_cap(stats)
    print_message
    print_stats(stats)
  end

  def clear_screen
    system('cls')
    system('clear')
  end
end
