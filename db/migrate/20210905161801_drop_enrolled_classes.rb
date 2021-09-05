class DropEnrolledClasses < ActiveRecord::Migration[6.0]
  def change
    drop_table :enrolled_classes
  end
end
