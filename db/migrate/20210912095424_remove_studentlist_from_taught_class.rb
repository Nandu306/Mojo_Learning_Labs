class RemoveStudentlistFromTaughtClass < ActiveRecord::Migration[6.0]
  def change
    remove_column :taught_classes, :studentlist, :string
  end
end
