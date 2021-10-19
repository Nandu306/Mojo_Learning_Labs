class TaughtClass < ApplicationRecord
  
  belongs_to :user, -> { where role: "teacher" }
  # has_many :students, ->{ where role: "student" }, through: :class_memberships, source: :user
  has_many :class_memberships, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_one :school, through: :user


end
