require 'csv'
require './../constants/operations'

class Calculate
  def self.maximum(array)
    array.max
  end

  def self.minimum(array)
    array.min
  end

  def self.calculate(operation, filename)
    file = CSV.read(filename, headers: true)
    array_values = file['Численность'].map(&:to_i)
    case operation
    when MAXIMUM
      maximum(array_values)
    when MINIMUM
      minimum(array_values)
    end
  end
end
