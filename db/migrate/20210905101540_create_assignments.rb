class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.string :topic
      t.integer :score
      t.integer :status
      t.datetime :deadline
      t.references :question, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.references :taught_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
