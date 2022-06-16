class ChangeTaughtClassesStudentsToStudentlist < ActiveRecord::Migration[6.0]
  def change
    rename_column :taught_classes, :students, :studentlist
  end
end
