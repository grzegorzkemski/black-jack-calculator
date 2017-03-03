class BlackJackCalculator
  FACE_VALUES = %w(J Q K)
  ACE_VALUE   = 'A'
  BLACK_JACK  = 21

  def initialize
    @cards = []
  end

  def score
    sum = base_sum

    ace_count.times { sum += 10 if sum + 10 <= BLACK_JACK }

    sum
  end

  def add_card(card)
    @cards << card
  end

  def add_cards(*cards)
    @cards += cards
  end

  def bust?
    score > BLACK_JACK
  end

  def black_jack?
    score == BLACK_JACK
  end

  private

  def card_score(card)
    if FACE_VALUES.include?(card)
      10
    elsif ace?(card)
      1
    else
      card.to_i
    end
  end

  def ace?(card)
    card == ACE_VALUE
  end

  def ace_count
    @cards.count &method(:ace?)
  end

  def base_sum
    @cards.reduce(0) { |sum, card| sum + card_score(card) }
  end
end
