require './lib/converter'

RSpec.describe Converter do
  describe 'converter' do
    context 'celsius to fahrenheit' do
      it { expect(Converter.convert(10.0, 'C', 'F')).to eq 50.0 }
    end

    context 'celsius to kelvin' do
      it { expect(Converter.convert(10.0, 'C', 'K')).to eq 283.15 }
    end

    context 'fahrenheit to celsius' do
      it { expect(Converter.convert(10.0, 'F', 'C')).to eq(-12.22) }
    end

    context 'fahrenheit to kelvin' do
      it { expect(Converter.convert(10.0, 'F', 'K')).to eq 260.93 }
    end

    context 'kelvin from celsius' do
      it { expect(Converter.convert(10.0, 'K', 'C')).to eq(-263.15) }
    end

    context 'kelvin from fahrenheit' do
      it { expect(Converter.convert(10.0, 'K', 'F')).to eq(-441.67) }
    end
  end
end
