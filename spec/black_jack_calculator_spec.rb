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

    it 'returns 11 score for Ace card when good for the player' do
      subject.add_card 'A'

      expect(subject.score).to eq 11
    end

    it 'returns 1 score for Ace card when 11 score is not good for the player' do
      subject.add_card '7'
      subject.add_card '8'
      subject.add_card 'A'

      expect(subject.score).to eq 16
    end
  end

end