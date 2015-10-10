require "card"
require "rspec"

describe Card do

  describe "#initialize" do

    it "creates a card with the given suit and value" do
      card =  Card.new(:spades, :ace)
      expect(card.suit).to eq(:spades)
      expect(card.value).to eq(:ace)
    end

    it "doesn't allow creation of a card with a value or suit that doesn't exist" do
      expect{Card.new(:rocks, :joker)}.to raise_error(ArgumentError)
    end

  end

  describe "#==" do
    card1 = Card.new(:spades, :ace)
    card2 = Card.new(:spades, :three)
    card3 = Card.new(:hearts, :ace)
    card4 = Card.new(:clubs, :eight)

    it "returns true if the other cards is equivalent in suit or value" do
      expect(card1==card2).to be true
      expect(card1==card3).to be true
    end


    it "returns false if the card is neither the same suit or value" do
      expect(card2==card3).to be false
    end

    it "returns true if the value of the first card is an eight" do
      expect(card4==card3).to be true
    end
  end


end
