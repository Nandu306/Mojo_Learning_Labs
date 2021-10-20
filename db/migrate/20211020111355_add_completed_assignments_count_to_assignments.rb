class AddCompletedAssignmentsCountToAssignments < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :completed_assignments_count, :integer
  end
end
