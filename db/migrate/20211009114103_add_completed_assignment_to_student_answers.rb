class AddCompletedAssignmentToStudentAnswers < ActiveRecord::Migration[6.0]
  def change
    add_reference :student_answers, :completed_assignment, null: true, foreign_key: true
  end
end
