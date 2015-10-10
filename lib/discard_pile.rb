class DiscardPile

  attr_reader :cards
  def initialize(deck)
    @deck = deck
    @cards = deck.draw(1)
  end

  def add(card)
    raise "cannot play that card on top of the pile" unless card == @cards.first
    @cards.unshift(card)
  end

  def top_card
    @cards.first
  end

  def shuffle_into_deck
    top_card = @cards.shift
    @deck.add_to(@cards)
    @deck.shuffle
    @cards = [top_card]
  end



end
