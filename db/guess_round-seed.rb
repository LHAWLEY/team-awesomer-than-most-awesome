module GuessRoundSeed
  3.times do |x|
    Round.create({deck_id: 1, user_id: x+1})
  end

  3.times do |x|
    round = rand(1..3)
    deck = Deck.find(x+1)
    deck.cards.each do |card|
      Guess.create({card_id: card.id, round_id: round, status: true})
    end
  end
end


