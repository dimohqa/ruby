require 'json'

class OutputSave
  def save(stat)
    File.open("./../saves/#{save_name}.json", 'w') do |f|
      f.write(JSON.pretty_generate(stat))
    end
  end

  def save_name
    loop do
      puts 'Введите название сохранения:'
      save_name = gets.chomp
      break unless save_names.include? save_name

      puts "Сохранение с именем #{save_name} уже существует!"
    end
  end

  def save_names
    saves = Dir.entries('./../saves/').reject { |f| File.directory? f }
    saves.map! { |filename| filename.split('.')[0] }
  end
end
