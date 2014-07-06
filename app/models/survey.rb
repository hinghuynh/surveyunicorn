class Survey < ActiveRecord::Base
  has_many :questions
  has_one :creator, class_name: :user
  has_many :completed_surveys
  has_many :users, through: :completed_surveys

  def self.uncompleted_surveys(user_id)
    completed_surveys = CompletedSurvey.where(user_id: user_id).pluck(:survey_id)
    if completed_surveys
    self.where.not(id: completed_surveys)
    end
  end
end
