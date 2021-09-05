class TaughtClass < ApplicationRecord
  belongs_to :user
  serialize :students, Array

end
