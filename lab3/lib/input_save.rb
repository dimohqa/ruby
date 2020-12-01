require './constants/path_constants'

class InputSave
  def self.read(save_name, filepath = SAVES)
    JSON.parse(File.read("#{filepath}#{save_name}.json"))
  end

  def self.load_json(filename)
    JSON.parse(File.read(filename))
  end

  def self.select_save(filepath = SAVES)
    puts 'Список сохраненных игр:'
    puts save_names

    name_save = ''
    saves = save_names(filepath)
    loop do
      puts 'Выберете одно из сохранений: '
      name_save = gets.chomp

      break if save_exist(saves, name_save)

      puts 'Этого сохранения нет в списке, попробуйте еще раз!'
    end

    name_save
  end

  def self.save_exist(saves, save)
    saves.include? save
  end

  def self.save_names(filepath = SAVES)
    saves = Dir.entries(filepath).reject { |f| File.directory? f }
    saves.map! { |filename| filename.split('.')[0] }
  end
end
