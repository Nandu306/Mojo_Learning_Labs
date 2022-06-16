class AddAssignmentToStudentAnswers < ActiveRecord::Migration[6.0]
  def change
    add_reference :student_answers, :assignment, null: true, foreign_key: true
  end
end
