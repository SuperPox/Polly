class AlterPossibleAnswersTable < ActiveRecord::Migration[5.2]
  def change
    add_column(:possible_answers, :taker, :string)
  end
end
