require 'colorize'
require './constants/string_constant'

class OutputInterface
  class << self
    attr_reader :message
  end

  def self.print_menu
    puts 'Меню:'
    puts '1 - Начать новую игру'
    puts '2 - Продолжить игру'
    puts '3 - выйти из игры'
  end

  def self.print_welcome
    puts 'Добро пожаловать в игру!'
  end

  def self.print_regulations(filepath = './regulations.txt')
    File.open(filepath, 'r').each do |line|
      if line[0] == '['
        puts line.chop.yellow
      else
        puts line
      end
    end
  end

  def self.print_choose_number(start, finish)
    puts "Выберите число от #{start} до #{finish}!".red
  end

  def self.print_stats(stats)
    puts "Здоровье: #{stats['health']}"
    puts "Счастье: #{stats['fun']}"
    puts "Усталость: #{stats['fatigue']}"
    puts "Опьянение: #{stats['mana']}"
    puts "Деньги: #{stats['money']}"
  end

  def self.set_void_message
    @message = VOID_MESSAGE
  end

  def self.set_work_error
    @message = WORK_ERROR
  end

  def self.set_money_error
    @message = MONEY_ERROR
  end

  def self.set_death_message
    @message = DEATH_MESSAGE
  end

  def self.print_message
    @message = VOID_MESSAGE if @message.nil?
    puts @message.red
    set_void_message
  end

  def self.print_cap(stats)
    print_message
    print_stats(stats)
    set_void_message
    puts
  end

  def self.clear_screen
    system('cls')
    system('clear')
  end
end
