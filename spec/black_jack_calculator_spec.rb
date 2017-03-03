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

  xdescribe '#bust?'

  xdescribe '#black_jack?'

end