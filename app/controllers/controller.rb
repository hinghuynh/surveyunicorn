get '/' do
  if logged_in?
    @user = current_user
    @surveys = Survey.all
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
  @surveys = Survey.all
  @user = User.new(name: params[:user_name], email: params[:email])
  @user.password = params[:password]
  @user.save!
  session[:user_id] = @user.id
  erb :survey_list
end

post '/login' do
  @user = User.find_by("email = ?", params[:email])
  @surveys = Survey.all

  if @user == nil
    puts "user equals nil!"
    # status 422
    halt 400, "User does not exist"
  elsif @user.password == params[:password]
    session[:user_id] = @user.id
    erb :survey_list
  else
    puts "ELSE!"
    status 422
    return "Email and Password do not match"
  end
end

get '/sign_out' do
  session.clear
  redirect '/'
end

get '/user/:user_id/profile' do
  @user = User.find(params[:user_id])
  @surveys = Survey.where(creator_id: params[:user_id])
  @completed_surveys = CompletedSurvey.where(user_id: params[:user_id])
  erb :profile
end

get '/user/:user_id/survey/:survey_id/results' do
  @user = User.find(params[:user_id])
  @survey = Survey.find(params[:survey_id])
  erb :survey_result
end
#----------- SURVEY -----------


get '/user/:id/create_survey' do
  @user = User.find(params[:id])
  erb :create_a_survey
end

# post '/user/:id/create_question' do
#   @user = User.find(params[:id])
#   erb :create_question
# end

post '/user/:user_id/create_survey' do
  @user = current_user
  if params[:survey_title] != nil
    @survey = Survey.create(name: params[:survey_title], creator_id: params[:user_id])
  end
  if params[:question_title] != nil
    question = Question.create(survey_id: params[:survey_id], content: params[:question_title])
    Answer.create(question_id: question.id, content: params[:question_answer1]) if params[:question_answer1] != ""
    Answer.create(question_id: question.id, content: params[:question_answer2]) if params[:question_answer2] != ""
    Answer.create(question_id: question.id, content: params[:question_answer3]) if params[:question_answer3] != ""
    Answer.create(question_id: question.id, content: params[:question_answer4]) if params[:question_answer4] != ""
  end
    # erb :question_form, layout: false, locals: {user: @user}

end

get '/user/:user_id/survey/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  @user = User.find(params[:user_id])
  erb :survey
end

get '/user/:user_id/completed_survey/:survey_id' do
  @user = User.find(params[:user_id])
  erb :view_survey
end

post '/user/:user_id/survey/:survey_id/save' do
  counter = 0
  survey = Survey.find_by(id: params[:survey_id])
  puts "these are the params #{params}"
  until params[:'#{counter}'] == nil
    UserAnswer.create(answer_id: params[:'#{counter}'], user_id: params[:user_id])
    QuestionAnswer.create(answer_id: params[:'#{counter}'], question_id: survey.questions[counter].id)
    counter += 1
  end

  CompletedSurvey.create(user_id: params[:user_id], survey_id: params[:survey_id])

  @user = User.find(params[:user_id])
  @surveys = Survey.all

  erb :survey_list
end

#----------- EDIT -----------

get '/user/:user_id/survey/:survey_id/edit' do

  @user = User.find(params[:user_id])
  @survey = Survey.find(params[:survey_id])

  erb :edit_survey
end

post "/user/:user_id/survey/:survey_id/edit_title" do
  Survey.update(params[:survey_id], name: params[:survey_name])
  redirect "/user/#{params[:user_id]}/survey/#{params[:survey_id]}/edit"
end

get "/user/:user_id/survey/:survey_id/question/:question_id" do
  @user = User.find(params[:user_id])
  @survey = Survey.find(params[:survey_id])
  @question = Question.find(params[:question_id])

  erb :edit_question
end

post"/user/:user_id/survey/:survey_id/question/:question_id/edit" do
 @user = User.find(params[:user_id])
  @survey = Survey.find(params[:survey_id])
  Question.update(params[:question_id], content: params[:question_title])
  @question = Question.find(params[:question_id])
  @question.answers.each do |answer|
    if params[:"#{answer.id}"] == ""
      Answer.destroy(answer.id)
    else
      Answer.update(answer.id, content: params[:"#{answer.id}"])
    end
  end
  erb :edit_survey
end
