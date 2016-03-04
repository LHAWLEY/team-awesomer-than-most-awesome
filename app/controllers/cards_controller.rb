get '/deck/:deck_id/cards/new' do

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
