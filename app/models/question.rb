class Question < ActiveRecord::Base
  # validates :content, presence: true
  belongs_to :survey
  has_many :answers
  has_many :question_answers
  has_many :survey_answers, through: :question_answers, source: :answer

end
