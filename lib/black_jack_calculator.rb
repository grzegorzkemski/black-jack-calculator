class BlackJackCalculator
  attr_reader :score

  def initialize
    @score = 0
  end

  def add_card(card)
    @score += card.to_i
  end
end
