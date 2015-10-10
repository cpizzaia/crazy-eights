class Hand

  attr_reader :cards
  def initialize(deck, cards = deck.draw(8))
    @deck = deck
    @cards = cards
  end
  




end
