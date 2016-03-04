get '/' do
  if session[:user_id]
    @user = get_user_by_id(session[:user_id])
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



get '/login' do
  erb :'users/login'
end

post '/login' do
  @user = User.find_by(username: params[:username]) unless !params[:username]
  redirect '/users/login' if !@user
  if @user.authenticate(params)
    session[:user_id] = @user.id
    redirect '/users/' + @user.id.to_s
  else
    erb :'users/login'
  end
end

get '/users/:id' do
  @user = get_user_by_id(params[:id])
  erb :'users/show'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end


