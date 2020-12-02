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
      state = {
        'mana' => 10,
        'fun' => 0,
        'money' => 700,
        'fatigue' => 75,
        'health' => 50,
        'death' => false
      }
      @valera.work
      expect(@valera.state).to eq state
    end

    it 'should correct if in work' do
      @valera.state['mana'] = 60
      @valera.state['fatigue'] = 10
      @valera.work
      expect(@valera.state['fun']).to eq 5
    end

    it 'nature' do
      state = {
        'mana' => 30,
        'fun' => 6,
        'money' => 600,
        'fatigue' => 15,
        'health' => 50,
        'death' => false
      }
      @valera.nature
      expect(@valera.state).to eq state
    end

    it 'song' do
      state = {
        'mana' => 50,
        'fun' => 6,
        'money' => 610,
        'fatigue' => 25,
        'health' => 50,
        'death' => false
      }
      @valera.song
      expect(@valera.state).to eq state
    end

    it 'should correct if in song' do
      @valera.state['mana'] = 50
      @valera.song
      expect(@valera.state['money']).to eq 660
    end

    it 'vine_serial' do
      state = {
        'mana' => 70,
        'fun' => 4,
        'money' => 580,
        'fatigue' => 15,
        'health' => 45,
        'death' => false
      }
      @valera.alcohol_action('vine_serial')
      expect(@valera.state).to eq state
    end

    it 'bar' do
      state = {
        'mana' => 100,
        'fun' => 6,
        'money' => 500,
        'fatigue' => 45,
        'health' => 40,
        'death' => false
      }
      @valera.alcohol_action('bar')
      expect(@valera.state).to eq state
    end

    it 'drink' do
      state = {
        'mana' => 100,
        'fun' => 10,
        'money' => 450,
        'fatigue' => 85,
        'health' => 0,
        'death' => false
      }
      @valera.alcohol_action('drink')
      expect(@valera.state).to eq state
    end

    it 'sleep' do
      state = {
        'mana' => 0,
        'fun' => 5,
        'money' => 600,
        'fatigue' => 0,
        'health' => 50,
        'death' => false
      }
      @valera.sleep
      expect(@valera.state).to eq state
    end
  end

  describe 'helpers' do
    it 'should return enough_money? positive result' do
      expect(@valera.enough_money?(300)).to eq true
    end

    it 'should return enough_money? negative result' do
      expect(@valera.enough_money?(-1000)).to eq false
    end

    it 'should return death_state? positive result' do
      expect(@valera.death_state?(10, 10)).to eq true
    end

    it 'should return death_state? negative result' do
      expect(@valera.death_state?(10, 11)).to eq false
    end

    it 'should return death? positive result with mana' do
      @valera.state['mana'] = 100
      expect(@valera.death?).to eq true
    end

    it 'should return death? positive result with health' do
      @valera.state['health'] = 0
      expect(@valera.death?).to eq true
    end

    it 'should return death? positive result with health and mana' do
      @valera.state['health'] = 100
      @valera.state['mana'] = 100
      expect(@valera.death?).to eq true
    end

    it 'should return death? negative result' do
      expect(@valera.death?).to eq false
    end
  end

  describe 'attribute' do
    it 'change_attribute mana' do
      @valera.change_attribute('mana', 50)
      expect(@valera.state['mana']).to eq 90
    end

    it 'change_attribute health' do
      @valera.change_attribute('health', 50)
      expect(@valera.state['health']).to eq 100
    end

    it 'change_attribute fun' do
      @valera.change_attribute('fun', 50)
      expect(@valera.state['fun']).to eq 10
    end

    it 'change_attribute money' do
      @valera.change_attribute('money', 50)
      expect(@valera.state['money']).to eq 650
    end

    it 'change_attribute fatigue' do
      @valera.change_attribute('fatigue', 50)
      expect(@valera.state['fatigue']).to eq 55
    end
  end
end
