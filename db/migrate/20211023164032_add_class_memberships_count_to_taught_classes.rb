class AddClassMembershipsCountToTaughtClasses < ActiveRecord::Migration[6.0]
  def change
    add_column :taught_classes, :class_memberships_count, :integer
  end
end
