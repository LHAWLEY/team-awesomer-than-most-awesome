module GuessRoundSeed
  3.times do |x|
    Round.create({deck_id: 1, user_id: x+1})
  end

  3.times do |x|
    3.times do |round|
      deck = Deck.find(x+1)
      deck.cards.each do |card|
        Guess.create({card_id: card.id, round_id: round+1, status: true})
      end
    end
  end
end


