require './converter'
require './../constants/degree'

class Io
  def self.check_valid_scale(scale)
    scale != CELSIUS && scale != KELVIN && scale != FAHRENHEIT
  end

  def self.start
    degree = input_degree
    base_scale = input_base_scale
    result_scale = input_result_scale

    result = Converter.convert(degree, base_scale, result_scale)

    puts "Result(#{base_scale}, #{result_scale}) = #{result}"
  end

  def self.input_degree
    puts 'Enter degree: '
    degree = gets.chomp

    if degree.match(Regexp.new(/\d.\d+/)).nil?
      puts 'insert the number'
      exit
    end

    degree.to_f
  end

  def self.input_base_scale
    puts 'Enter base scale(C, K, F): '
    start_scale = gets.chomp

    if check_valid_scale(start_scale)
      puts 'insert correct base scale'
      exit
    end

    start_scale
  end

  def self.input_result_scale
    puts 'Enter end scale(C, K, F): '
    end_scale = gets.chomp

    if check_valid_scale(end_scale)
      puts 'insert correct result scale'
      exit
    end

    end_scale
  end
end

Io.start
