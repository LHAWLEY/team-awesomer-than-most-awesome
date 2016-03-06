require_relative '../config/environment'

  describe User do
    let(:user) {User.first}
    describe 'associations' do
      it 'has many rounds' do
        expect(user.rounds.first).to be_kind_of(Round)
      end

      it 'has many decks' do # not working
        expect(user.decks.first).to be_kind_of(Deck)
      end
    end
  end

describe Round do
  let(:round) {Round.first}
  describe 'associations' do
    it 'has a user' do
      expect(round.user.username.class).to eq(String)
    end

    it 'has a deck' do
      expect(round.deck.subject).to eq('Presidents')
    end

     it 'has many guesses' do
      expect(round.guesses.first).to be_kind_of(Guess)
    end
  end
end


describe Deck do
  let(:deck) {Deck.first}
  describe 'associations' do
    it 'has many rounds' do
      expect(deck.rounds.first).to be_kind_of(Round)
    end

    it 'has many cards' do
      expect(deck.cards.first.question).to eq("At his inauguration, George Washington only had 1 tooth. At different times, he wore dentures. What were his dentures made of?")
    end

     it 'has a creator' do
      expect(deck.creator.username.class).to eq(String)
    end
  end
end

describe Card do
  let(:card) {Card.first}
  describe 'associations' do
    it 'has many guesses' do
     expect(card.guesses.last).to be_kind_of(Guess)
    end

    it 'has a deck' do
      expect(card.deck.subject).to eq('Presidents')
    end
  end
end

describe Guess do
  let(:guess) {Guess.first}
  describe 'associations' do
    it 'has a round' do
      expect(guess.round).to be_kind_of(Round)
    end

    it 'has a card' do
      expect(guess.card.question).to eq("At his inauguration, George Washington only had 1 tooth. At different times, he wore dentures. What were his dentures made of?")
    end
  end
end