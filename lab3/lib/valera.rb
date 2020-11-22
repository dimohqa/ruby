class Valera
  attr_accessor :fun, :mana, :fatigue, :health, :money, :death

  def work
    return unless @mana < 50 && @fatigue < 10

    @fun -= 5
    @mana -= 30
    @money += 100
    @fatigue += 70
  end

  def nature
    @fun = @fun + 1
    @mana = @mana + 10
    @fatigue = @fatigue + 10
  end

  def vine_serial
    @fun += 1
    @mana += 30
    @fatigue += 10
    @health -= 5
    @money -= 20
  end

  def drink
    @fun = 5
    @health -= 80
    @mana += 90
    @fatigue += 80
    @money -= 150
  end

  def sing
    @fun += 1
    @mana += 10
    @money += if @mana > 40 & @mana && 40 & @mana < 70
                60
              else
                10
              end
    @fatigue += 20
  end

  def sleep
    @health += 90 if @mana < 30
    @fun -= 3 if @mana > 70
    @mana -= 50
    @fatigue -= 70
  end

  def bar
    @fun += 1
    @mana += 60
    @fatigue += 40
    @health -= 10
    @money -= 100
  end
end
