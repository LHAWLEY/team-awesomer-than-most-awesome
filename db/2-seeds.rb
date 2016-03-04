<<<<<<< HEAD
# require-relative './deck-seed'

# include DeckSeed



  3.times do
    deck = Deck.create!(subject: Faker::Name.name, creator_id: 1)

    deck.cards.create!(answer: "a", question: "a just so its easy for us")
    deck.cards.create!(answer: "b", question: "b just so its easy for us")
  end
=======
require_relative './user-seed'

include UserSeed
>>>>>>> master
