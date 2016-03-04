get '/decks' do

  @deck = Deck.all #define instance variable for view
  puts "Hello\n\n\n"
  erb :'decks/index' #shows all deck view (index)

end


get '/decks/new' do

  erb :'decks/new' #shows view with new deck form

end


post '/decks' do

  #below works with properly formatted params in HTML form
  @deck = Deck.new(subject: params[:subject], creator_id: 1) #create new deck

  if @deck.save #saves new deck or returns false if unsuccessful
    redirect "/decks/#{@deck.id}/cards/new" #links back to decks index page
  else
    erb :errors #shows an errors view you define
  end

end

get '/decks/:deck_id/cards' do
  @deck = Deck.find(params[:deck_id])

  @cards = @deck.cards

  erb :'cards/index'

end
