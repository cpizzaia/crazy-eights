require 'hand'
require 'deck'
require 'rspec'

describe Hand do
  let(:standard_deck) {Deck.new}
  describe "#initialize" do

    it "takes in a deck and draws 8 cards from it" do
      hand = Hand.new(standard_deck)
      expect(hand.cards.length).to eq(8)
    end


  end
end
