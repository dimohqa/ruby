require './lib/input_save'

RSpec.describe InputSave do
  describe 'methods' do
    it 'break select save' do
      InputSave.stub(:gets).and_return('4', 'test')
      allow(InputSave).to receive(:save_names).and_return(['test'])
      InputSave.select_save('./saves/')
    end

    it 'save_names' do
      expect(InputSave.save_names('./saves')).to eq %w[game_1 test]
    end
  end
end
