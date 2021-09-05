class Assignment < ApplicationRecord
  belongs_to :question
  belongs_to :user
  belongs_to :taught_class
end
