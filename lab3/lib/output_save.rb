require 'json'

class OutputSave
  def self.save(stat, save_name)
    File.open("./../saves/#{save_name}.json", 'w') do |f|
      f.write(JSON.pretty_generate(stat))
    end
  end

  def self.enter_save_name(_filepath = './../saves/')
    save_name = ''

    loop do
      puts 'Введите название сохранения:'
      save_name = gets.chomp
      break unless save_exist(save_names, save_name)

      puts "Сохранение с именем #{save_name} уже существует!"
    end

    save_name
  end

  def self.save_exist(saves, save)
    saves.include? save
  end

  def self.save_names(filepath = './../saves/')
    saves = Dir.entries(filepath).reject { |f| File.directory? f }
    saves.map! { |filename| filename.split('.')[0] }
  end
end
