require './output_module'

class Valera
  include Output

  attr_accessor :state, :boundaries

  def initialize(state)
    @config = JSON.parse(File.read('./config/action.json'))
    @boundaries = JSON.parse(File.read('./config/boundaries.json'))
    @state = state
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

  def vine_serial
    change_fun(@config['vine_serial']['fun'])
    change_mana(@config['vine_serial']['mana'])
    change_fatigue(@config['vine_serial']['fatigue'])
    change_health(@config['vine_serial']['health'])
    change_money(@config['vine_serial']['money'])
  end

  def drink
    change_fun(@config['drink']['fun'])
    change_health(@config['drink']['health'])
    change_mana(@config['drink']['mana'])
    change_fatigue(@config['drink']['fatigue'])
    change_money(@config['drink']['money'])
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

  def bar
    change_fun(@config['bar']['fun'])
    change_mana(@config['bar']['mana'])
    change_fatigue(@config['bar']['fatigue'])
    change_health(@config['bar']['health'])
    change_money(@config['bar']['money'])
  end

  private

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
