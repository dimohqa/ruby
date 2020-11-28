require 'json'

class OutputSave
  def save(stat)
    File.open("./../saves/#{save_name}.json", 'w') do |f|
      f.write(JSON.pretty_generate(stat))
    end
  end

  def save_name
    puts 'Введите название сохранения:'
    gets.chomp
  end
end
