get '/' do
  @users = User.all
  erb :index
end

#----------- USERS-----------

get '/login' do
  erb :login
end

get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  @user = User.new(name: params[:user_name], email: params[:email])
  @user.password = params[:password]
  @user.save!
  session[:user_id] = @user.id
  erb :survey_list
end

post 'login' do
  @user = User.find_by("email = ?", params[:email])
  if @user == nil
    erb :login
  elsif @user.password == params[:password]
    session[:user_id] = @user.id
    erb :survey_list
  else 
    erb :login
  end
end

#----------- SURVEY -----------

