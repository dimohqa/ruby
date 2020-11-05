require './../constants/operations'
require './calculate'

class Io
  def self.start
    if ARGV.length != 2
      puts 'Incorrect length arguments. Enter operation'
      exit
    end

    if check_uncorrect_operation(ARGV[0])
      puts 'Enter correct operation[\'maximum\', \'minimum\', \'average\', \'dispersion\']'
      exit
    end

    if check_correct_path(ARGV[1])
      puts 'Enter the correct path to the .csv file'
      exit
    end

    puts Calculate.calculate(ARGV[0], ARGV[1])
  end

  def self.check_uncorrect_operation(operation)
    operation != MAXIMUM && operation != MINIMUM && operation != AVERAGE && operation != VARIANCE
  end

  def self.check_correct_path(filepath)
    filepath.match(Regexp.new(/.(\.csv)$/)).nil?
  end
end

Io.start
