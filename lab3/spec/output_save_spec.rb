require './lib/output_save'

RSpec.describe OutputSave do
  describe 'methods' do
    it 'break select save' do
      OutputSave.stub(:gets).and_return('test', 'test333')
      allow(OutputSave).to receive(:save_names).and_return(['test'])
      OutputSave.enter_save_name('./saves/')
    end

    it 'save_names' do
      expect(OutputSave.save_names('./saves')).to eq %w[game_1 test]
    end

    it 'save' do
      state = {
        'health' => 50,
        'mana' => 40,
        'fun' => 5,
        'money' => 600,
        'fatigue' => 5,
        'death' => false
      }
      buffer = StringIO.new
      filename = 'somefile.json'
      allow(File).to receive(:open).with("./../saves/#{filename}.json", 'w').and_yield(buffer)
      OutputSave.save(state, filename)
      expect(JSON.parse(buffer.string)).to eq(state)
    end
  end
end
