class AddQuestionToStudentAnswers < ActiveRecord::Migration[6.0]
  def change
    add_reference :student_answers, :question, null: true, foreign_key: true
  end
end
