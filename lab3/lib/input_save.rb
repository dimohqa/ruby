require './valera'

class InputSave
  def read
    save_name = select_save
    file = File.read("./../saves/#{save_name}.json")
    stats = JSON.parse(file)
    Valera.new(stats)
  end

  def initial_config
    stats = JSON.parse(File.read('./config/stats.json'))
    Valera.new(stats)
  end

  def init_valera(stats, valera)
    valera.health = stats['health']
    valera.money = stats['money']
    valera.fun = stats['fun']
    valera.mana = stats['mana']
    valera.fatigue = stats['fatigue']
    valera.death = stats['death']
  end

  def select_save
    puts 'Список сохраненных игр:'
    puts save_names

    name_save_file = ''
    loop do
      puts 'Выберете одно из сохранений: '
      name_save_file = gets.chomp

      break if save_names.include? name_save_file

      puts 'Этого сохранения нет в списке, попробуйте еще раз!'
    end

    name_save_file
  end

  def save_names
    saves = Dir.entries('./../saves/').reject { |f| File.directory? f }
    saves.map! { |filename| filename.split('.')[0] }
  end
end
