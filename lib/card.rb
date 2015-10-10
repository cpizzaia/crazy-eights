class Card
  SUITS = {
    :clubs    => "♣",
    :diamonds => "♦",
    :hearts   => "♥",
    :spades   => "♠"
  }

  VALUES = {
    :deuce => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "10",
    :jack  => "J",
    :queen => "Q",
    :king  => "K",
    :ace   => "A"
  }

  def self.suits
    SUITS.keys
  end

  def self.values
    VALUES.keys
  end

  attr_reader :suit, :value

  def initialize(suit, value)
    unless Card.suits.include?(suit) and Card.values.include?(value)
      raise ArgumentError.new("illegal suit (#{suit}) or value (#{value})")
    end

    @suit, @value = suit, value
  end

  #checks if either the suit or value is equal or the card is an eight
  def ==(other_card)
    @suit == other_card.suit || @value == other_card.value || @value == :eight
  end

  def to_s
    VALUE[@value] + SUIT[@suit]
  end
end
