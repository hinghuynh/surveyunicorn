class CreateQuestionAnswer < ActiveRecord::Migration
  def change
  	create_table :question_answers do |t|
  		t.integer :question_id
  		t.integer :answer_id
  	end
  end
end
