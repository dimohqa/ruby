require 'json'

class IOFiles
  def read_file(valera)
    save_name = select_save
    file = File.read("./../saves/#{save_name}.json")
    stats = JSON.parse(file)

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

  def save_file(valera)
    puts 'Введите название сохранения: '
    game_name = gets.chomp
    File.new(`./../saves/#{game_name}`, 'w') do |file|
      file.write('money', valera.money)
      file.write('fun', valera.fun)
      file.write('mana', valera.mana)
      file.write('fatigue', valera.fatigue)
      file.write('health', valera.health)
    end
  end

  def print_regulations
    File.open('./regulations.txt', 'r').each do |line|
      puts line
    end
  end
end
