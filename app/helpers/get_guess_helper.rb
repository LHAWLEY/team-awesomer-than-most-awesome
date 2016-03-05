def get_guess(round)
  guess_pool = []
  guess_pool = round.guesses.shuffle

  guess_pool.each do |guess|
    if guess.status == false
      guess.status = true
      guess.save
      return guess
    end
  end
  return nil
end
