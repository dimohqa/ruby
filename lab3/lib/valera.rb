require './output_module'

class Valera
  include Output

  attr_accessor :state, :boundaries

  def initialize(state)
    @config = JSON.parse(File.read('./config/action.json'))
    @boundaries = JSON.parse(File.read('./config/boundaries.json'))
    @death_state = JSON.parse(File.read('./config/death_state.json'))
    @state = state
  end

  def stat
    @state
  end

  def work
    if @state['mana'] >= 50 || @state['fatigue'] >= 10
      print_work_error
      return
    end

    change_fun(@config['work']['fun'])
    change_mana(@config['work']['mana'])
    change_money(@config['work']['money'])
    change_fatigue(@config['work']['fatigue'])
  end

  def nature
    change_fun(@config['nature']['fun'])
    change_mana(@config['nature']['mana'])
    change_fatigue(@config['nature']['fatigue'])
  end

  def alcohol_action(action)
    alcohol_action_change(action) if enough_money?(@config[action]['money'])
  end

  def song
    change_fun(@config['song']['fun'])
    change_mana(@config['song']['mana'])
    if @state['mana'] > 40 && @state['mana'] < 70
      change_money(60)
    else
      change_money(10)
    end
    change_fatigue(@config['song']['fatigue'])
  end

  def sleep
    change_health(@config['sleep']['health']) if @state['mana'] < 30
    change_fun(@config['sleep']['fun']) if @state['mana'] > 70
    change_mana(@config['sleep']['mana'])
    change_fatigue(@config['sleep']['fatigue'])
  end

  def death?
    return true if death_state?(@state['health'], @death_state['health'])

    return true if death_state?(@state['mana'], @death_state['mana'])

    false
  end

  private

  def death_state?(stat_value, death_value)
    if stat_value == death_value
      @state['death'] = true
      return true
    end
    false
  end

  def alcohol_action_change(action)
    change_fun(@config[action]['fun'])
    change_mana(@config[action]['mana'])
    change_fatigue(@config[action]['fatigue'])
    change_health(@config[action]['health'])
    change_money(@config[action]['money'])
  end

  def enough_money?(cost)
    if @state['money'] <= -cost
      print_money_error
      false
    else
      true
    end
  end

  def reference_values(value)
    @state[value] = @boundaries[value]['min'] if @state[value] < @boundaries[value]['min']
    @state[value] = @boundaries[value]['max'] if @state[value] > @boundaries[value]['max']
  end

  def change_mana(step)
    @state['mana'] += step
    reference_values('mana')
  end

  def change_fun(step)
    @state['fun'] += step
    reference_values('fun')
  end

  def change_health(step)
    @state['health'] += step
    reference_values('health')
  end

  def change_fatigue(step)
    @state['fatigue'] += step
    reference_values('fatigue')
  end

  def change_money(step)
    @state['money'] += step
  end
end
