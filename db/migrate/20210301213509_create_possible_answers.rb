class CreatePossibleAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :possible_answers do |t|
      t.integer :question_id
      t.string :content
    end
  end
end
