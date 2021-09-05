class EnrolledClass < ApplicationRecord
  has_many :students, -> { where(role: "student") }, class_name: "User"
  belongs_to :taught_class
end
