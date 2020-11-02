require './lib/calculate'
require './../constants/operations'

RSpec.describe Calculate do
  describe 'calculate' do
    context 'maximum' do
      it { expect(Calculate.calculate(MAXIMUM, 'lib/input.csv')).to eq 100 }
    end
  end
end
