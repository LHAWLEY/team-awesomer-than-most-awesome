get '/' do
  if session[:user_id]
    @user = get_user_by_id(session[:user_id])
    puts "\n\n\n\n\n\n\n\nNO UID!"
    erb :'users/show'
  else
    redirect '/login'
  end
end

get '/userlist' do
  @users = User.all
  erb :'users/userlist'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new({username: params[:username]})
  @user.password = params[:password]

  if @user.save
    session[:user_id] = @user.id
    erb :'users/created'
  else
    erb :errors
  end
end

get '/users/:id' do
  @user = get_user_by_id(params[:id])
  erb :'users/show'
end




