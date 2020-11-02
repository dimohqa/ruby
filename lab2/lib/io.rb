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
    else
      puts Calculate.calculate(ARGV[0], ARGV[1])
    end
  end

  def self.check_uncorrect_operation(operation)
    operation != MAXIMUM && operation != MINIMUM && operation != AVERAGE && operation != DISPERSION
  end
end

Io.start
