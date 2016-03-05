get '/decks' do

  @deck = Deck.all #define instance variable for view
  erb :'decks/index' #shows all deck view (index)

end


get '/decks/new' do

  erb :'decks/new' #shows view with new deck form

end


post '/decks' do

  #below works with properly formatted params in HTML form
  @deck = Deck.new(subject: params[:subject], creator_id: session[:user_id]) #create new deck

  if @deck.save #saves new deck or returns false if unsuccessful
    redirect "/decks/#{@deck.id}/cards/new" #links back to decks index page
  else
    erb :errors #shows an errors view you define
  end

end

get '/decks/:deck_id/cards' do
  @deck = Deck.find(params[:deck_id])

  @cards = @deck.cards

  erb :'cards/show'

end

get '/decks/:id/edit' do

  #get params from url
  @deck = Deck.find(params[:id]) #define intstance variable for view

  erb :'decks/edit' #shows view with edit deck form

end

put '/decks/:id' do

  #get params from url
  @deck = Deck.find(params[:id]) #define variable to edit

  @deck.assign_attributes(subject: params[:subject]) #assign new attributes

  if @deck.save #saves new deck or returns false if unsuccessful
    redirect '/decks' #links back to decks index page
  else
    erb :errors #shows an errors view you define
  end

end

delete '/decks/:id' do

  #get params from url
  @deck = Deck.find(params[:id]) #define deck to delete

  @deck.destroy #delete deck

  redirect '/decks' #redirects back to decks index page

end
