require './constants/degree'

class Converter
  def self.convert_celsius_to_kelvin(value)
    (value + K).round(2)
  end

  def self.convert_celsius_to_fahrenheit(value)
    (value * 1.8 + 32).round(2)
  end

  def self.convert_fahrenheit_to_celsius(value)
    ((value - 32) / 1.8).round(2)
  end

  def self.convert_fahrenheit_to_kelvin(value)
    ((value - 32) / 1.8 + K).round(2)
  end

  def self.convert_from_celsius(value, result_scale)
    case result_scale
    when KELVIN
      convert_celsius_to_kelvin(value)
    when FAHRENHEIT
      convert_celsius_to_fahrenheit(value)
    end
  end

  def self.convert_from_fahrenheit(value, result_scale)
    case result_scale
    when CELSIUS
      convert_fahrenheit_to_celsius(value)
    when KELVIN
      convert_fahrenheit_to_kelvin(value)
    end
  end

  def self.convert(value, base_scale, result_scale)
    return value if base_scale == result_scale

    case base_scale
    when CELSIUS
      convert_from_celsius(value, result_scale)
    when FAHRENHEIT
      convert_from_fahrenheit(value, result_scale)
    end
  end
end
