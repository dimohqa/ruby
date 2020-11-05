require 'csv'
require './../constants/operations'

class Calculate
  def self.maximum(array)
    array.max
  end

  def self.minimum(array)
    array.min
  end

  def self.average(array)
    (array.sum / array.size.to_f).round(2)
  end

  def self.variance(array)
    mean = average(array)
    sum = 0.0
    array.each { |v| sum += (v - mean)**2 }
    (sum / array.size).round(2)
  end

  def self.calculate(operation, filename)
    file = CSV.read(filename, headers: true)
    array_values = file['Численность'].map(&:to_i)
    case operation
    when MAXIMUM
      maximum(array_values)
    when MINIMUM
      minimum(array_values)
    when AVERAGE
      average(array_values)
    when VARIANCE
      variance(array_values)
    end
  end
end
