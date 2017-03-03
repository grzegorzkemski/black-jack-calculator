class BlackJackCalculator
  FACE_VALUES = %w(J Q K)
  ACE_VALUE = 'A'
  BLACK_JACK = 21

  def initialize
    @cards = []
  end

  def score
    sum = 0
    @cards.each { |card| sum += card_score(sum, card) }
    sum
  end

  def add_card(card)
    @cards << card
  end

  def add_cards(*cards)
    @cards += cards
  end

  private

  def card_score(sum, card)
    if FACE_VALUES.include?(card)
      10
    elsif ace?(card) && sum + 11 > BLACK_JACK
      1
    elsif ace?(card)
      11
    else
      card.to_i
    end
  end

  def ace?(card)
    card == ACE_VALUE
  end
end
