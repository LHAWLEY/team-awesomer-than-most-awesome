def first_try(round)
  count = 0
  round.deck.cards.each do |card|
    x = Guess.where(round_id: round.id, card_id: card.id).count
    count += 1 if x == 1
  end
  return count
end
