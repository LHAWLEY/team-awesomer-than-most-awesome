
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

get '/logout' do
  session.clear
  redirect '/'
end
