require "deck"
require "card"
require "rspec"

describe Deck do
  let(:deck_array) {Deck.create_standard_deck}
  let(:one_card_deck) {Deck.new([Card.new(:spades, :ace)])}

  describe "::create_standard_deck" do
    it "it returns an array with 52 cards" do
      expect(deck_array.length).to eq(52)
    end

    it "the deck contains 4 suits for each value and 13 values for each suit" do

      suit_hash = Hash.new(0)
      value_hash = Hash.new(0)
      deck_array.each do |card|
        suit_hash[card.suit] += 1
        value_hash[card.value] += 1
      end

      expect(suit_hash.values.all?{|val| val == 13}).to be true
      expect(value_hash.values.all?{|val| val == 4}).to be true
    end
  end

  describe "#initialize" do

    it "allows the user to input a deck of cards" do
       card_array = [Card.new(:spades, :ace), Card.new(:hearts, :three)]
       custom_deck = Deck.new(card_array)
       expect(custom_deck.deck).to eq(card_array)
    end

    it "if no input is taken it uses a standard deck as default" do
      expect(Deck.new.deck).to eq(deck_array)
    end
  end

  describe "#draw" do

    king_of_hearts = Card.new(:hearts, :king)
    jack_of_spades = Card.new(:spades, :jack)
    three_of_clubs = Card.new(:clubs, :three)
    card_array = [king_of_hearts, jack_of_spades, three_of_clubs]
    three_card_deck = Deck.new(card_array)

    drawn_cards = three_card_deck.draw(2)


    #top of the deck is defined as first position in the array
    it "takes in an amount of cards to draw from the top of the deck" do
      expect(drawn_cards).to eq([king_of_hearts, jack_of_spades])
    end

    it "modifies the original deck to missing the cards it took" do
      expect(three_card_deck.deck).to eq([three_of_clubs])
    end

    it "raises an error when you try to draw more cards than are in the deck" do
      expect{three_card_deck.draw(2)}.to raise_error(ArgumentError)
    end

  end

  describe "#shuffle" do
    standard_deck = Deck.new
    shuffled_deck = Deck.new
    shuffled_deck.shuffle

    it "shuffles the deck" do
      expect(standard_deck.deck).to_not eq(shuffled_deck.deck)
    end
  end

  describe "#empty?" do
    it "checks if the deck is empty" do
      expect(one_card_deck.empty?).to be false
      one_card_deck.draw(1)
      expect(one_card_deck.empty?).to be true
    end
  end

  describe "#add_to" do

    it "it adds cards to the deck" do
      one_card_deck.add_to([Card.new(:spades, :ace)])
      expect(one_card_deck.deck.length).to eq(2)
    end
  end
end
