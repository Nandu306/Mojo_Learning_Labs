class AddAssignmentToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_reference :questions, :assignment, null: false, foreign_key: true
  end
end
