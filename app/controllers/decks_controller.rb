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
  @deck = Deck.find(params[:id]) #define intstance variable for view

  erb :'decks/edit' #shows view with edit deck form

end

put '/decks/:id' do

  #get params from url
  @deck = Deck.find(params[:id])

  @deck.assign_attributes(subject: params[:subject])
  answers = params[:answer]
  params[:question].each do |k,v|
    card = Card.find(k.to_i)
    card.update({question: v, answer: answers[k] })
  end

  if (params[:newquestion] != "") && (params[:newanswer] != "")
    Card.create(question: params[:newquestion], answer: params[:newanswer], deck_id: @deck.id)
  end

  if @deck.save
    redirect '/decks'
  else
    erb :errors
  end

end

delete '/decks/:id' do

  #get params from url
  @deck = Deck.find(params[:id]) #define deck to delete

  @deck.destroy #delete deck

  redirect '/decks' #redirects back to decks index page

end


