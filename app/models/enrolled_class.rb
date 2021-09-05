class EnrolledClass < ApplicationRecord
  belongs_to :user
  belongs_to :taught_class
end
