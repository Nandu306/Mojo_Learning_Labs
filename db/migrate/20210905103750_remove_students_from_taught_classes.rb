class RemoveStudentsFromTaughtClasses < ActiveRecord::Migration[6.0]
  def change
    remove_column :taught_classes, :students, :string
  end
end
