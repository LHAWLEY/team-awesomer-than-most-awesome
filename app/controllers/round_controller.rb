get '/decks/:deck_id/startround' do
  if session[:user_id] == nil
    @user = User.create({username: "anonymous"})
    @round = Round.create({user_id: 0, deck_id: params[:deck_id]})
    redirect "/rounds/#{@round.id}/firstcard"
  else
    @round = Round.create({user_id: current_user.id, deck_id: params[:deck_id]})
  end
  erb :'rounds/index'
end

get '/rounds/:id/firstcard' do
  round = Round.find(params[:id])
  round.cards.each do |card|
    Guess.create({card_id: card.id, round_id: round.id})
  end
  @guess = get_guess(round)
  erb :'rounds/showcard'
end

get '/rounds/:id/showcard' do
  round = Round.find(params[:id])
  @guess = get_guess(round)
  erb :'rounds/showcard'
end

post '/rounds/:id/check_answer' do
  round = Round.find(params[:id])
  guess = Guess.find(params[:guess_id])

  if params[:answer] != guess.card.answer
    Guess.create({card_id: guess.card_id, round_id: round.id})
  end

  @guess = get_guess(round)
  if @guess == nil
    @round = round

    erb :'rounds/done'
  else
    erb :'rounds/showcard'
  end

end
