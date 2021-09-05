class CreateEnrolledClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :enrolled_classes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :taught_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
