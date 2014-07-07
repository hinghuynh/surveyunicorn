require 'bcrypt'

class User < ActiveRecord::Base
  has_many :surveys_created, class_name: :survey, dependent: :destroy
  has_many :completed_surveys, dependent: :destroy
  has_many :surveys, through: :completed_surveys
  has_many :user_answers
  has_many :answers, through: :user_answers


  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
