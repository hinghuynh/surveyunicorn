class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :survey
  validates :content, presence: true
end
