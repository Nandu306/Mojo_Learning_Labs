class AddEnrolledClassToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :enrolled_class, null: false, foreign_key: true
  end
end
