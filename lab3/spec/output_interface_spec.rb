require '../lib/output_interface'
require '../../lab3/lib/constants/string_constant'
require 'colorize'

RSpec.describe OutputInterface do
  before(:each) do
    $stdout = StringIO.new
    OutputInterface.set_void_message
  end

  state = {
    'health' => 50,
    'mana' => 40,
    'fun' => 5,
    'money' => 600,
    'fatigue' => 5,
    'death' => false
  }

  describe 'Set methods' do
    it 'set_void_message' do
      OutputInterface.set_void_message
      expect(OutputInterface.message).to eq VOID_MESSAGE
    end

    it 'set_work_error' do
      OutputInterface.set_work_error
      expect(OutputInterface.message).to eq WORK_ERROR
    end

    it 'set_money_error' do
      OutputInterface.set_money_error
      expect(OutputInterface.message).to eq MONEY_ERROR
    end

    it 'set_death_message' do
      OutputInterface.set_death_message
      expect(OutputInterface.message).to eq DEATH_MESSAGE
    end
  end

  describe 'Output methods' do
    it 'print_menu' do
      OutputInterface.print_menu
      require_relative '../lib/output_interface'

      $stdout.rewind

      expect($stdout.gets.strip).to eq('Меню:')
      expect($stdout.gets.strip).to eq('1 - Начать новую игру')
      expect($stdout.gets.strip).to eq('2 - Продолжить игру')
      expect($stdout.gets.strip).to eq('3 - выйти из игры')
    end

    it 'print_welcome' do
      OutputInterface.print_welcome
      require_relative '../lib/output_interface'

      $stdout.rewind

      expect($stdout.gets.strip).to eq('Добро пожаловать в игру!')
    end

    it 'print_regulations' do
      OutputInterface.print_regulations('./lib/regulations.txt')
      require_relative '../lib/output_interface'

      $stdout.rewind

      File.open('./lib/regulations.txt', 'r').each do |line|
        if line[0] == '['
          expect($stdout.gets.strip).to eq(line.chop.yellow)
        else
          expect($stdout.gets.strip).to eq(line.chop)
        end
      end
    end

    it 'print_choose_number' do
      OutputInterface.print_choose_number(1, 10)
      require_relative '../lib/output_interface'

      $stdout.rewind

      expect($stdout.gets.strip).to eq('Выберите число от 1 до 10!'.red)
    end

    it 'print_stats' do
      OutputInterface.print_stats(state)
      require_relative '../lib/output_interface'

      $stdout.rewind

      expect($stdout.gets.strip).to eq("Здоровье: #{state['health']}")
      expect($stdout.gets.strip).to eq("Счастье: #{state['fun']}")
      expect($stdout.gets.strip).to eq("Усталость: #{state['fatigue']}")
      expect($stdout.gets.strip).to eq("Опьянение: #{state['mana']}")
      expect($stdout.gets.strip).to eq("Деньги: #{state['money']}")
    end

    it 'print_message' do
      OutputInterface.print_message
      require_relative '../lib/output_interface'

      $stdout.rewind

      expect($stdout.gets.strip).to eq(VOID_MESSAGE.red)
    end

    it 'print_cap' do
      OutputInterface.print_cap(state)
      require_relative '../lib/output_interface'

      $stdout.rewind

      expect($stdout.gets.strip).to eq(VOID_MESSAGE.red)
      expect($stdout.gets.strip).to eq("Здоровье: #{state['health']}")
      expect($stdout.gets.strip).to eq("Счастье: #{state['fun']}")
      expect($stdout.gets.strip).to eq("Усталость: #{state['fatigue']}")
      expect($stdout.gets.strip).to eq("Опьянение: #{state['mana']}")
      expect($stdout.gets.strip).to eq("Деньги: #{state['money']}")
      expect($stdout.gets.strip).to eq('')
    end
  end
end
