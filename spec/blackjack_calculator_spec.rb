require 'blackjack_calculator'

describe BlackjackCalculator do

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

    context 'given Ace card' do
      it 'returns 11 score when good for the player' do
        subject.add_card 'A'

        expect(subject.score).to eq 11
      end

      context 'given 11 score is not good for the player' do
        it 'returns 1 score when Ace is the last card' do
          subject.add_cards '7', '8', 'A'

          expect(subject.score).to eq 16
        end

        it 'returns 1 score when Ace is the first card' do
          subject.add_cards 'A', '8', '7'

          expect(subject.score).to eq 16
        end
      end
    end
  end

  describe '#bust?' do
    context 'given a game with more than 21 points' do
      it 'returns true' do
        subject.add_cards 'K', '8', '7'

        expect(subject.bust?).to be_truthy
      end
    end

    context 'given a game with less or equal to 21 points' do
      it 'returns false' do
        subject.add_cards '5', '8', '7'

        expect(subject.bust?).to be_falsey
      end
    end
  end

  describe '#black_jack?' do
    context 'given a game with exactly 21 points' do
      it 'returns true' do
        subject.add_cards 'K', '10', 'A'

        expect(subject.black_jack?).to be_truthy
      end
    end

    context 'given a game with a score different than 21 points' do
      it 'returns false' do
        subject.add_cards '5', '8', '7'

        expect(subject.black_jack?).to be_falsey
      end
    end
  end

end