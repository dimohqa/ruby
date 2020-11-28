require './valera'

class InputSave
  def self.read(save_name)
    file = File.read("./../saves/#{save_name}.json")
    stats = JSON.parse(file)
    Valera.new(stats)
  end

  def self.initial_config
    stats = JSON.parse(File.read('./config/stats.json'))
    Valera.new(stats)
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
