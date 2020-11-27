require 'json'

class OutputSave
  def save(valera)
    stats = {
      money: valera.money,
      fun: valera.fun,
      mana: valera.mana,
      fatigue: valera.fatigue,
      health: valera.health
    }
    File.open("./../saves/#{save_name}.json", 'w') do |f|
      f.write(JSON.pretty_generate(stats))
    end
  end

  def save_name
    puts 'Введите название сохранения:'
    gets.chomp
  end
end
