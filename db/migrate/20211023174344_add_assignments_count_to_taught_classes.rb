class AddAssignmentsCountToTaughtClasses < ActiveRecord::Migration[6.0]
  def change
    add_column :taught_classes, :assignments_count, :integer
  end
end
