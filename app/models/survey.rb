class Survey < ActiveRecord::Base
  has_many :questions
  has_one :creating_user, table_name: :users
  has_many :completed_surveys
  has_many :users, through: :completed_surveys
end
