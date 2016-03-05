module DeckSeed

  6.times do
    deck = Deck.create!(subject: Faker::Name.name, creator_id: 1)

    deck.cards.create!(answer: "a", question: "a just so its easy for us")
    deck.cards.create!(answer: "b", question: "b just so its easy for us")
  end


end
