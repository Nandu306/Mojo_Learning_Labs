class RemoveStatusFromAssignments < ActiveRecord::Migration[6.0]
  def change
    remove_column :assignments, :status, :integer
  end
end
