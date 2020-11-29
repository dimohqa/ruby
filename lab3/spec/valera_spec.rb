require './lib/valera'

RSpec.describe Valera do
  describe 'actions' do
    before(:each) do
      state = {
        'health' => 50,
        'mana' => 40,
        'fun' => 5,
        'money' => 100,
        'fatigue' => 5,
        'death' => false
      }
      action_config = JSON.parse(File.read('./lib/config/action.json'))
      boundaries = JSON.parse(File.read('./lib/config/boundaries.json'))
      death_state = JSON.parse(File.read('./lib/config/death_state.json'))
      @valera = Valera.new(state, action_config, boundaries, death_state)
    end

    it 'change_attribute' do
      @valera.change_attribute('mana', 50)
      expect(@valera.state['mana']).to eq 90

      @valera.change_attribute('health', 50)
      expect(@valera.state['health']).to eq 100

      @valera.change_attribute('fun', 50)
      expect(@valera.state['fun']).to eq 10

      @valera.change_attribute('money', 50)
      expect(@valera.state['money']).to eq 150

      @valera.change_attribute('fatigue', 50)
      expect(@valera.state['fatigue']).to eq 55
    end

    it 'work' do
      @valera.work
      expect(@valera.state['mana']).to eq 10
      expect(@valera.state['fun']).to eq 0
      expect(@valera.state['money']).to eq 200
      expect(@valera.state['fatigue']).to eq 75
      expect(@valera.state['health']).to eq 50
    end

    it 'nature' do
      @valera.nature
      expect(@valera.state['mana']).to eq 30
      expect(@valera.state['fun']).to eq 6
      expect(@valera.state['fatigue']).to eq 15
    end

    it 'song' do
      @valera.song
      expect(@valera.state['fun']).to eq 6
      expect(@valera.state['mana']).to eq 50
      expect(@valera.state['money']).to eq 110
      expect(@valera.state['fatigue']).to eq 25
    end
  end
end
