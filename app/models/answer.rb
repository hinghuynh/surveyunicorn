class Answer < ActiveRecord::Base
  has_many :user_answers
  has_many :users, through: :user_answers
  belongs_to :questions
end
