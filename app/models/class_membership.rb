class ClassMembership < ApplicationRecord
  belongs_to :user, -> { where role: "student" }
  belongs_to :taught_class, counter_cache: true
  has_many :assignments, through: :taught_class
end
