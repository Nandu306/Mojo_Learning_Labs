class RemoveTaughtClassFromEnrolledClasses < ActiveRecord::Migration[6.0]
  def change
    remove_reference :enrolled_classes, :taught_class, null: false, foreign_key: true
  end
end
