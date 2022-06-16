class AddOptionToStudentAnswers < ActiveRecord::Migration[6.0]
  def change
    add_reference :student_answers, :option, null: true, foreign_key: true
  end
end
