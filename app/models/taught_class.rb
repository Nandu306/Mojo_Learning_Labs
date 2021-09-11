class TaughtClass < ApplicationRecord
  
  belongs_to :user
  has_many :assignments, dependent: :destroy
  serialize :studentlist, Array

end
