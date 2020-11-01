require './constants/degree'

class Converter
  def self.convert_to_k_from_c(value)
    (value + K).round(2)
  end

  def self.convert_to_f_from_c(value)
    (value * 1.8 + 32).round(2)
  end

  def self.convert_from_c(value, result_scale)
    case result_scale
    when KELVIN
      convert_to_k_from_c(value)
    when FAHRENHEIT
      convert_to_f_from_c(value)
    end
  end

  def self.convert(value, base_scale, result_scale)
    return value if base_scale == result_scale

    case base_scale
    when CELSIUS
      convert_from_c(value, result_scale)
    end
  end
end
