class AddStudentsToTaughtClasses < ActiveRecord::Migration[6.0]
  def change
    add_column :taught_classes, :students, :text, default: [].to_yaml
  end
end
