class AddNoteToAssignments < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :note, :string
  end
end
