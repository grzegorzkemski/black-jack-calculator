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
      subject.add_cards 'J', 'Q', 'K'

      expect(subject.score).to eq 30
    end

    it 'returns 11 score for Ace card when good for the player' do
      subject.add_card 'A'

      expect(subject.score).to eq 11
    end

    it 'returns 1 score for Ace card when 11 score is not good for the player' do
      subject.add_cards '7', '8', 'A'

      expect(subject.score).to eq 16
    end

    xit 'returns 1 score for Ace card when 11 score is not good for the player, when Ace is a first card'
  end

end