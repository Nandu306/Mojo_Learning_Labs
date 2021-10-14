class ClassMembership < ApplicationRecord
  belongs_to :user, -> { where role: "student" }
  belongs_to :taught_class
  has_many :assignments, through: :taught_class
end
