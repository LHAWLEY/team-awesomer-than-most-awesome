get '/decks/:deck_id/cards/new' do
  @deck = Deck.find(params[:deck_id])
  erb :'cards/new'
end

get '/decks/:deck_id/cards/:id' do

  @deck = Deck.find(params[:deck_id])

  @card = @deck.cards.find(params[:id])

  erb :'cards/show'

end

get '/decks/:deck_id/cards/new' do

  @deck = Deck.find(params[:deck_id])

  erb :'cards/new'

end

post '/decks/:deck_id/cards' do

  @deck = Deck.find(params[:deck_id])
  p @deck
  puts "asdfasdf\n\n\n"
  @card = @deck.cards.new(params[:card])
  p @card
  puts "123123\n\n"
  if @card.save
    if params[:commit] == "Next Card"
      redirect "/decks/#{@deck.id}/cards/new"
    else
      erb :'cards/show'
    end
  else
    erb :'cards/new'
  end

end

get '/decks/:deck_id/cards/:id/edit' do

  @deck = Deck.find(params[:deck_id])

  @card = @deck.cards.find(params[:id])

  erb :'cards/edit'

end

put '/decks/:deck_id/cards/:id' do

  @deck = Deck.find(params[:deck_id])

  @card = @deck.cards.find(params[:id])

  if @card.update_attributes(params[:card])
    redirect "/decks/#{@deck.id}/cards"
  else
    erb :'cards/edit'
  end

end

delete '/decks/:deck_id/cards/:id' do

  @deck = Deck.find(params[:deck_id])

  @card = @deck.cards.find(params[:id])

  @card.destroy

  redirect "/decks/#{@deck.id}/cards"

end
