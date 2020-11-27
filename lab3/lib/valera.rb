class Valera
  attr_accessor :state
  def initialize(state)
    @config = JSON.parse(File.read('./config/action.json'))
    @state = state
  end

  def print_stat
    puts "health: #{@state['health']}"
    puts "fun: #{@state['fun']}"
    puts "fatigue: #{@state['fatigue']}"
    puts "mana: #{@state['mana']}"
    puts "money: #{@state['money']}"
  end

  def work
    if @state['mana'] < 50 && @state['fatigue'] < 10
      puts 'Слишком много алкоголя и слишком мало усталости'
      return
    end

    @state['fun']  += @config['work']['fun']
    @state['mana'] += @config['work']['mana']
    @state['money'] += @config['work']['money']
    @state['fatigue'] += @config['work']['fatigue']
  end

  def nature
    @state['fun'] += @config['nature']['fun']
    @state['mana'] += @config['nature']['mana']
    @state['fatigue'] += @config['nature']['fatigue']
  end

  def vine_serial
    @state['fun'] += @config['vine_serial']['fun']
    @state['mana'] += @config['vine_serial']['mana']
    @state['fatigue'] += @config['vine_serial']['fatigue']
    @state['health'] += @config['vine_serial']['health']
    @state['money'] += @config['vine_serial']['money']
  end

  def drink
    @state['fun']+= @config['drink']['fun']
    @state['health'] += @config['drink']['health']
    @state['mana'] += @config['drink']['mana']
    @state['fatigue'] += @config['drink']['fatigue']
    @state['money'] += @config['drink']['money']
  end

  def song
    @state['fun'] += @config['song']['fun']
    @state['mana']+= @config['song']['mana']
    @state['money'] += if @state['mana'] > 40 & @state['mana'] && 40 & @state['mana'] < 70
                60
              else
                10
              end
    @state['fatigue'] += @config['song']['fatigue']
  end

  def sleep
    @state['health'] += @config['sleep']['health'] if @state['mana'] < 30
    @state['fun'] += @config['sleep']['fun'] if @state['mana'] > 70
    @state['mana'] += @config['sleep']['mana']
    @state['fatigue'] += @config['sleep']['fatigue']
  end

  def bar
    @state['fun'] += @config['bar']['fun']
    @state['mana'] += @config['bar']['mana']
    @state['fatigue'] += @config['bar']['fatigue']
    @state['health'] += @config['bar']['health']
    @state['money'] += @config['bar']['money']
  end
end
