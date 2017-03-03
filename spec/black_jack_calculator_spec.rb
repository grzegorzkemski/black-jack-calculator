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

    it 'returns 10 score for Jack card' do
      subject.add_card 'J'

      expect(subject.score).to eq 10
    end

    it 'returns 10 score for face cards' do
      subject.add_card 'J'
      subject.add_card 'Q'
      subject.add_card 'K'

      expect(subject.score).to eq 30
    end
  end

end