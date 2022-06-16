class RemoveStudentAnswerFromStudentAnswers < ActiveRecord::Migration[6.0]
  def change
    remove_column :student_answers, :student_answer, :string
  end
end
