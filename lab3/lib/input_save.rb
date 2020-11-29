class InputSave
  def self.read(save_name)
    filepath = saves_filepath(save_name)
    file = File.read(filepath)
    JSON.parse(file)
  end

  def self.saves_filepath(save_name)
    File.join(Dir.pwd, '..', 'saves', "#{save_name}.json")
  end

  def self.load_json(filename)
    JSON.parse(File.read(filename))
  end

  def self.select_save
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

  def self.save_names
    saves = Dir.entries('./../saves/').reject { |f| File.directory? f }
    saves.map! { |filename| filename.split('.')[0] }
  end
end
