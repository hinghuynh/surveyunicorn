get '/' do
  if logged_in?
    @user = current_user
    erb :survey_list
  else
    erb :index
  end
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

post '/login' do
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

get '/sign_out' do
  session.clear
  redirect '/'
end

#----------- SURVEY -----------


post '/user/:id/create_survey' do
  @user = User.find(params[:id])
  erb :create_survey
end

post '/user/:id/create_question' do
  @survey = Survey.create(name: params[:survey_title], creator_id: params[:id])
  erb :create_question
end

post '/user/:user_id/survey/:survey_id/create_question' do
  @survey = survey.find(params[:survey_id])
  question = Question.create(survey_id: params[:survey_id], content: params[:question_title])
  Answer.create(question_id: question.id, content: params[:question_answer1]) if params[:question_answer1] != ""
  Answer.create(question_id: question.id, content: params[:question_answer2]) if params[:question_answer2] != ""
  Answer.create(question_id: question.id, content: params[:question_answer3]) if params[:question_answer3] != ""
  Answer.create(question_id: question.id, content: params[:question_answer4]) if params[:question_answer4] != ""
  erb :create_question
end

post '/user/:user_id/survey/:survey.id' do
  @survey = survey.find(params[:survey_id])
  @user = User.find(params[:id])
  erb :survey
end

post '/user/:user_id/survey/:survey_id/save' do
  erb :survey_list
end


