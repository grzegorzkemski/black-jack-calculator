require 'black_jack_calculator'

describe BlackJackCalculator do

  describe '#score' do
    it 'returns 0 for empty game' do
      expect(subject.score).to eq 0
    end

    it 'returns correct score for regular card' do
      subject.add_card '2'

      expect(subject.score).to eq 2
    end
  end

end