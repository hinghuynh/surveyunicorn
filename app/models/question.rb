class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :survey
  has_many :question_answers
  has_many :survey_answers, through: :question_answers, source: :answer
end
