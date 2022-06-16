class RemoveUserFromStudentAnswer < ActiveRecord::Migration[6.0]
  def change
    remove_reference :student_answers, :user, null: false, foreign_key: true
  end
end
