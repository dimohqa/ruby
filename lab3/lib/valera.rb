class Valera
  attr_accessor :fun, :mana, :fatigue, :health, :money, :death

  def initialize
    @config = JSON.parse(File.read('./config/action.json'))
  end

  def work
    if @mana < 50 && @fatigue < 10
      puts 'Слишком много алкоголя и слишком мало усталости'
      return
    end

    @fun += @config['work']['fun']
    @mana += @config['work']['mana']
    @money += @config['work']['money']
    @fatigue += @config['work']['fatigue']
  end

  def nature
    @fun += @config['nature']['fun']
    @mana += @config['nature']['mana']
    @fatigue += @config['nature']['fatigue']
  end

  def vine_serial
    @fun += @config['vine_serial']['fun']
    @mana += @config['vine_serial']['mana']
    @fatigue += @config['vine_serial']['fatigue']
    @health += @config['vine_serial']['health']
    @money += @config['vine_serial']['money']
  end

  def drink
    @fun += @config['drink']['fun']
    @health += @config['drink']['health']
    @mana += @config['drink']['mana']
    @fatigue += @config['drink']['fatigue']
    @money += @config['drink']['money']
  end

  def sing
    @fun += @config['sing']['fun']
    @mana += @config['sing']['mana']
    @money += if @mana > 40 & @mana && 40 & @mana < 70
                60
              else
                10
              end
    @fatigue += @config['sing']['fatigue']
  end

  def sleep
    @health += @config['sleep']['health'] if @mana < 30
    @fun += @config['sleep']['fun'] if @mana > 70
    @mana += @config['sleep']['mana']
    @fatigue += @config['sleep']['fatigue']
  end

  def bar
    @fun += @config['bar']['fun']
    @mana += @config['bar']['mana']
    @fatigue += @config['bar']['fatigue']
    @health += @config['bar']['health']
    @money += @config['bar']['money']
  end
end
