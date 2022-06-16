class AddUserToTaughtClasses < ActiveRecord::Migration[6.0]
  def change
    add_reference :taught_classes, :user, null: false, foreign_key: true
  end
end
