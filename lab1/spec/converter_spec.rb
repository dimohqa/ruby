require './lib/converter'

RSpec.describe Converter do
  describe '.converter' do
    context 'convert celsius to fahrenheit' do
      it { expect(Converter.convert(10.0, 'C', 'F')).to eq 50.0 }
    end

    context 'convert celsius to kelvin' do
      it { expect(Converter.convert(10.0, 'C', 'K')).to eq 283.15 }
    end
  end
end
