require './lib/valera'

RSpec.describe Valera do
  describe 'actions' do
    state = {
      'health' => 50,
      'mana' => 0,
      'fun' => 0,
      'money' => 0,
      'fatigue' => 0,
      'death' => false
    }
    let(:action_config) { JSON.parse(File.read('./lib/config/action.json')) }
    let(:boundaries) { JSON.parse(File.read('./lib/config/boundaries.json')) }
    let(:death_state) { JSON.parse(File.read('./lib/config/death_state.json')) }

    it 'state' do
      valera = Valera.new(state, action_config, boundaries, death_state)
      expect(valera.state).to eq state
    end

    it 'change_attribute' do
      state = {
        'health' => 50,
        'mana' => 0,
        'fun' => 0,
        'money' => 0,
        'fatigue' => 0,
        'death' => false
      }
      valera = Valera.new(state, action_config, boundaries, death_state)

      valera.change_attribute('mana', 50)
      expect(valera.state['mana']).to eq 50

      valera.change_attribute('health', 50)
      expect(valera.state['health']).to eq 100

      valera.change_attribute('fun', 10)
      expect(valera.state['fun']).to eq 10

      valera.change_attribute('money', 50)
      expect(valera.state['money']).to eq 50

      valera.change_attribute('fatigue', 50)
      expect(valera.state['fatigue']).to eq 50
    end

    it 'work' do
      state = {
        'health' => 50,
        'mana' => 40,
        'fun' => 5,
        'money' => 0,
        'fatigue' => 0,
        'death' => false
      }
      valera = Valera.new(state, action_config, boundaries, death_state)

      valera.work
      expect(valera.state['mana']).to eq 10
      expect(valera.state['fun']).to eq 0
      expect(valera.state['money']).to eq 100
      expect(valera.state['fatigue']).to eq 70
      expect(valera.state['health']).to eq 50
    end

    it 'nature' do
      state = {
        'health' => 50,
        'mana' => 40,
        'fun' => 5,
        'money' => 0,
        'fatigue' => 0,
        'death' => false
      }
      valera = Valera.new(state, action_config, boundaries, death_state)

      valera.nature
      expect(valera.state['mana']).to eq 30
      expect(valera.state['fun']).to eq 6
      expect(valera.state['fatigue']).to eq 10
    end
  end
end
