class RemoveQuestionFromStudentAnswers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :student_answers, :question, null: false, foreign_key: true
  end
end
