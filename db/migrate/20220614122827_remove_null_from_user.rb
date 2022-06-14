class RemoveNullFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :null, :boolean
  end
end
