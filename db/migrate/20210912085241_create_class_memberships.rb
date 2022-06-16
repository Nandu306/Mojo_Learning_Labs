class CreateClassMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :class_memberships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :taught_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
