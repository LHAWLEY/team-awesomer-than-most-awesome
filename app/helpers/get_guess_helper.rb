def get_guess(round)
  loop do
    guess = round.guesses.sample
    if guess.status == false
      guess.status = true
      guess.save
      return guess
    end
  end
end
