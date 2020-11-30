require '../lib/output_interface'
require '../../lab3/lib/constants/string_constant'

RSpec.describe OutputInterface do
  describe 'Print interface' do
    before(:each) do
      OutputInterface.set_void_message
    end

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
end
