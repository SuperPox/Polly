class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer :poll_id
      t.integer :question_id
      t.integer :answer_id
    end
  end
end
