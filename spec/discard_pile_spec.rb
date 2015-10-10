require 'discard_pile'
require 'deck'
require 'card'
require 'rspec'
require 'byebug'

describe DiscardPile do
  let(:standard_deck) {Deck.new}
  let(:ace_of_spades) {Card.new(:spades, :ace)}
  let(:two_card_deck) {Deck.new([Card.new(:hearts, :jack), Card.new(:clubs, :ace)])}

  describe "#initialize" do

    it "takes in a deck and draws one card to start the pile" do

      discard_pile = DiscardPile.new(standard_deck)
      expect(discard_pile.cards.length).to eq(1)
      expect(standard_deck.deck.length).to eq(51)
    end
  end

  describe "#add" do

    it "adds the given card to the discard pile" do

      card = standard_deck.deck.first
      discard_pile = DiscardPile.new(standard_deck)
      discard_pile.add(card)
      expect(discard_pile.top_card).to eq(card)
    end

    it "it does not allow you to place a card thats not ==" do

      discard_pile = DiscardPile.new(two_card_deck)
      expect{discard_pile.add(Card.new(:spades, :ace))}.to raise_error("cannot play that card on top of the pile")
    end
  end


  describe "#top_card" do

    it "returns the top card of the pile" do

      deck = Deck.new([ace_of_spades, Card.new(:hearts, :three)])
      discard_pile = DiscardPile.new(deck)

      expect(discard_pile.top_card).to eq(ace_of_spades)
    end
  end

  describe "#shuffle_into_deck" do

    it "shuffles the discard pile into the deck" do
      discard_pile = DiscardPile.new(standard_deck)
      card = discard_pile.top_card
      discard_pile.add(card)
      discard_pile.shuffle_into_deck
      expect(discard_pile.top_card).to eq(card)
      expect(standard_deck.deck.length).to eq(52)
    end


    it "preserves the top card of the discard pile" do
      discard_pile = DiscardPile.new(standard_deck)
      card = discard_pile.top_card
      discard_pile.add(card)
      discard_pile.shuffle_into_deck
      expect(discard_pile.top_card).to eq(card)
    end
  end
end
