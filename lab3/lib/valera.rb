require './output_interface'

class Valera
  attr_accessor :state, :boundaries, :config

  def initialize(state, config, boundaries, death_state)
    @config = config
    @boundaries = boundaries
    @death_state = death_state
    @state = state
  end

  def work
    if @state['mana'] >= 50 || @state['fatigue'] >= 10
      OutputInterface.set_work_error
      return
    end

    change_attribute('fun', @config['work']['fun'])
    change_attribute('mana', @config['work']['mana'])
    change_attribute('money', @config['work']['money'])
    change_attribute('fatigue', @config['work']['fatigue'])
  end

  def nature
    change_attribute('fun', @config['nature']['fun'])
    change_attribute('mana', @config['nature']['mana'])
    change_attribute('fatigue', @config['nature']['fatigue'])
  end

  def alcohol_action(action)
    alcohol_action_change(action) if enough_money?(@config[action]['money'])
  end

  def song
    change_attribute('fun', @config['song']['fun'])
    if @state['mana'] > 40 && @state['mana'] < 70
      change_attribute('money', 60)
    else
      change_attribute('money', 10)
    end
    change_attribute('mana', @config['song']['mana'])
    change_attribute('fatigue', @config['song']['fatigue'])
  end

  def sleep
    change_attribute('health', @config['sleep']['health']) if @state['mana'] < 30
    change_attribute('fun', @config['sleep']['fun']) if @state['mana'] > 70
    change_attribute('mana', @config['sleep']['mana'])
    change_attribute('fatigue', @config['sleep']['fatigue'])
  end

  def death?
    return true if death_state?(@state['health'], @death_state['health'])

    return true if death_state?(@state['mana'], @death_state['mana'])

    false
  end

  def death_state?(stat_value, death_value)
    if stat_value == death_value
      @state['death'] = true
      return true
    end
    false
  end

  def alcohol_action_change(action)
    change_attribute('fun', @config[action]['fun'])
    change_attribute('mana', @config[action]['mana'])
    change_attribute('fatigue', @config[action]['fatigue'])
    change_attribute('health', @config[action]['health'])
    change_attribute('money', @config[action]['money'])
  end

  def enough_money?(cost)
    if @state['money'] <= -cost
      OutputInterface.set_money_error
      false
    else
      true
    end
  end

  def reference_values(attribute)
    @state[attribute] = @boundaries[attribute]['min'] if @state[attribute] < @boundaries[attribute]['min']
    @state[attribute] = @boundaries[attribute]['max'] if @state[attribute] > @boundaries[attribute]['max']
  end

  def change_attribute(attribute, step)
    @state[attribute] += step
    reference_values(attribute)
  end
end
