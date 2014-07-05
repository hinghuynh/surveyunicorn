class Answer < ActiveRecord::Base
  has_many :user_answers
  has_many :users, through: :user_answers
  belongs_to :questions
  has_many :questions_answers
  has_many :survey_questions, through: :questions_answers, source: :question
end
