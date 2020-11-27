require 'colorize'

module Output
  def print_menu
    system('cls')
    system('clear')
    puts 'Меню:'
    puts '1 - Начать новую игру'
    puts '2 - Продолжить игру'
    puts '3 - выйти из игры'
  end

  def print_welcome
    system('cls')
    system('clear')
    puts 'Добро пожаловать в игру!'
  end

  def print_regulations
    system('cls')
    system('clear')
    File.open('./regulations.txt', 'r').each do |line|
      if line[0] == '['
        puts line.chop.red
      else
        puts line
      end
    end
  end

  def print_choose_number
    puts 'Выберите число от 1 до 9!'
  end

  def print_stats(stats)
    system('cls')
    system('clear')
    puts "health: #{stats['health']}"
    puts "fun: #{stats['fun']}"
    puts "fatigue: #{stats['fatigue']}"
    puts "mana: #{stats['mana']}"
    puts "money: #{stats['money']}"
  end

  def print_work_error
    puts 'Слишком много алкоголя и слишком мало усталости'
  end

  def clear_screen
    system('cls')
    system('clear')
  end
end
