class TaughtClass < ApplicationRecord
  
  belongs_to :user
  has_many :assignments
  serialize :students, Array

end
