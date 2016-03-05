def first_try(round)
  count = 0
  puts "\n\n\n\n\n\n\n\n"
  p round
  round.deck.cards.each do |card|
    puts card.guesses.count
    count += 1 if card.guesses.count == 1
  end
  return count
end
