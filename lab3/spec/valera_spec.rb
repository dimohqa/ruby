require './lib/valera'

RSpec.describe Valera do
  before(:each) do
    state = {
      'health' => 50,
      'mana' => 40,
      'fun' => 5,
      'money' => 600,
      'fatigue' => 5,
      'death' => false
    }
    action_config = JSON.parse(File.read('./lib/config/action.json'))
    boundaries = JSON.parse(File.read('./lib/config/boundaries.json'))
    death_state = JSON.parse(File.read('./lib/config/death_state.json'))
    @valera = Valera.new(state, action_config, boundaries, death_state)
  end

  describe 'actions' do
    it 'work' do
      @valera.work
      expect(@valera.state['mana']).to eq 10
      expect(@valera.state['fun']).to eq 0
      expect(@valera.state['money']).to eq 700
      expect(@valera.state['fatigue']).to eq 75
      expect(@valera.state['health']).to eq 50
      @valera.state['mana'] = 60
      @valera.work
      expect(@valera.state['fun']).to eq 0
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
      expect(@valera.state['money']).to eq 610
      expect(@valera.state['fatigue']).to eq 25
      @valera.state['mana'] = 50
      @valera.song
      expect(@valera.state['money']).to eq 670
    end

    it 'vine_serial' do
      @valera.alcohol_action('vine_serial')
      expect(@valera.state['fun']).to eq 4
      expect(@valera.state['mana']).to eq 70
      expect(@valera.state['money']).to eq 580
      expect(@valera.state['fatigue']).to eq 15
    end

    it 'bar' do
      @valera.alcohol_action('bar')
      expect(@valera.state['fun']).to eq 6
      expect(@valera.state['mana']).to eq 100
      expect(@valera.state['money']).to eq 500
      expect(@valera.state['fatigue']).to eq 45
      expect(@valera.state['health']).to eq 40
    end

    it 'drink' do
      @valera.alcohol_action('drink')
      expect(@valera.state['fun']).to eq 10
      expect(@valera.state['mana']).to eq 100
      expect(@valera.state['money']).to eq 450
      expect(@valera.state['fatigue']).to eq 85
      expect(@valera.state['health']).to eq 0
    end

    it 'sleep' do
      @valera.sleep
      expect(@valera.state['fun']).to eq 5
      expect(@valera.state['mana']).to eq 0
      expect(@valera.state['money']).to eq 600
      expect(@valera.state['fatigue']).to eq 0
      expect(@valera.state['health']).to eq 50
    end
  end

  describe 'helpers' do
    it 'enough_money?' do
      expect(@valera.enough_money?(300)).to eq true
      expect(@valera.enough_money?(-1000)).to eq false
    end

    it 'death_state?' do
      expect(@valera.death_state?(10, 10)).to eq true
      expect(@valera.death_state?(10, 11)).to eq false
    end

    it 'death?' do
      expect(@valera.death?).to eq false
      @valera.state['health'] = 0
      expect(@valera.death?).to eq true
      @valera.state['health'] = 100
      @valera.state['mana'] = 100
      expect(@valera.death?).to eq true
    end
  end

  describe 'attribute' do
    it 'change_attribute' do
      @valera.change_attribute('mana', 50)
      expect(@valera.state['mana']).to eq 90

      @valera.change_attribute('health', 50)
      expect(@valera.state['health']).to eq 100

      @valera.change_attribute('fun', 50)
      expect(@valera.state['fun']).to eq 10

      @valera.change_attribute('money', 50)
      expect(@valera.state['money']).to eq 650

      @valera.change_attribute('fatigue', 50)
      expect(@valera.state['fatigue']).to eq 55
    end
  end
end
