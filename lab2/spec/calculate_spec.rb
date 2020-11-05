require './lib/calculate'
require './../constants/operations'

RSpec.describe Calculate do
  describe 'calculate' do
    filepath = 'lib/input.csv'

    context 'maximum' do
      it { expect(Calculate.calculate(MAXIMUM, filepath)).to eq 100 }
    end

    context 'minimum' do
      it { expect(Calculate.calculate(MINIMUM, filepath)).to eq 0 }
    end

    context 'average' do
      it { expect(Calculate.calculate(AVERAGE, filepath)).to eq 68.23 }
    end

    context 'variance' do
      it { expect(Calculate.calculate(VARIANCE, filepath)).to eq 260.49 }
    end
  end
end
