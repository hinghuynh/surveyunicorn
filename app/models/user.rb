class User < ActiveRecord::Base
  has_many :surveys_created, table_name: :survey
  has_many :completed_surveys
  has_many :surveys, through: :completed_surveys
  has_many :user_answers
  has_many :answers, through: :user_answers
end
