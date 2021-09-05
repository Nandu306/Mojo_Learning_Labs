class RemoveScoreFromAssignments < ActiveRecord::Migration[6.0]
  def change
    remove_column :assignments, :score, :string
  end
end
