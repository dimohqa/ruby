require '../lib/valera'
require '../lib/input_save'

RSpec.describe Valera do
  describe 'Valera' do
    file = File.read('./../config/stats.json')
    stats = JSON.parse(file)
    valera = Valera.new
    init_valera(stats, valera)

    context 'Initial' do
      it { expect(valera.state['health']).to eq 100 }
      it { expect(valera.state['mana']).to eq 0 }
      it { expect(valera.state['fun']).to eq 5 }
      it { expect(valera.state['money']).to eq 50 }
      it { expect(valera.state['fatigure']).to eq 0 }
      it { expect(valera.state['death']).to eq false }
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
