require 'black_jack_calculator'

describe BlackJackCalculator do

  describe '#score' do
    it 'returns 0 for empty game' do
      expect(subject.score).to eq 0
    end
  end

end