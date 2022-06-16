class CreateStudentAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :student_answers do |t|
      t.string :student_answer
      t.references :user, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
