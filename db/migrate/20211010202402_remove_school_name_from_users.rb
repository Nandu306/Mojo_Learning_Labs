class RemoveSchoolNameFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :school_name, :string
  end
end
