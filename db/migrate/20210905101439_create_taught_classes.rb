class CreateTaughtClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :taught_classes do |t|
      t.string :year
      t.string :subject
      t.string :students
      t.string :academic_year
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
