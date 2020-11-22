class IOFiles
  def open_file(valera)
    File.open("./../saves/#{filename_save_file}.txt", 'r').each do |line|
      name_attribute = line.split[0]
      value_attribute = line.split[1]

      case name_attribute
      when 'money'
        valera.money = value_attribute
      when 'fun'
        valera.fun = value_attribute
      when 'mana'
        valera.mana = value_attribute
      when 'fatigue'
        valera.fatigue = value_attribute
      when 'health'
        valera.health = value_attribute
      else
        puts 'Произошла ошибка при чтении файла игры.
        Проверьте правильность введеных атрибутов'
      end
    end
  end

  def filename_save_file
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
