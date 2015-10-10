require_relative "card"
class Deck

  def self.create_standard_deck
    result = []
    Card.suits.map do |suit|
      Card.values.map do |value|
        result << Card.new(suit, value)
      end
    end
    result
  end


  attr_reader :deck

  def initialize(deck = Deck.create_standard_deck)
    @deck = deck
  end

  def draw(n)
    raise ArgumentError.new("Not enough cards in the deck") if n > @deck.length
    cards = []
    n.times do
      cards << @deck.shift
    end
    cards
  end

  def shuffle
    @deck.shuffle!
  end

  def empty?
    @deck.empty?
  end

  def add_to(cards)
    @deck += cards
  end





end
