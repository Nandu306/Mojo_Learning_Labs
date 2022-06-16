class RemoveQuestionFromAssignments < ActiveRecord::Migration[6.0]
  def change
    remove_reference :assignments, :question, null: false, foreign_key: true
  end
end
