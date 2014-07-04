class CreateSurvey < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.string :creator_id
      t.timestamps
    end
  end
end
