class Question < ActiveRecord::Base
  validates :content, presence: true
  has_many :question_answers
  has_many :survey_answers, through: :question_answers, source: :answer
end
