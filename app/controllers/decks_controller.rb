get '/decks' do
  @deck = Deck.all
  erb :'decks/index'
end

post '/decks/search' do
  @deck = Deck.where("lower(subject) LIKE ?","%#{params[:search].downcase}%")
  erb :'decks/index'
end

get '/decksmostplayed' do
  @sorted_deck = Deck.all.sort {|a,b| b.rounds.count <=> a.rounds.count }
  @deck = Deck.order('id')
  erb :'decks/index'
end

get '/decksnewest' do
  @deck = Deck.order('updated_at desc')
  erb :'decks/index'
end

get '/decks/new' do
  erb :'decks/new'
end


post '/decks' do

  if params[:private] == "on"
    is_public = false
  else
    is_public = true
  end

  @deck = Deck.new(subject: params[:subject], creator_id: session[:user_id], is_public: is_public) #create new deck

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


