class CreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.integer :poll_id
      t.integer :question_id
      t.string :question
      t.integer :possible_answer_id
      t.string :possible_answer
    end
  end
end
