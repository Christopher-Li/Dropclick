class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    	t.string :content
    	t.integer :question_id
    	t.integer :votes

    	t.timestamps
    end
  end
end
