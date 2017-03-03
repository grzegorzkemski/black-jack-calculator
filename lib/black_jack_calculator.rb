class BlackJackCalculator
  def initialize
    @cards = []
  end

  def score
    sum = 0
    @cards.each { |card| sum += card_score(card) }
    sum
  end

  def add_card(card)
    @cards << card
  end

  private

  def card_score(card)
    if card == 'J'
      10
    else
      card.to_i
    end
  end
end
