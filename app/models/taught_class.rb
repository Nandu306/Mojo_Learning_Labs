class TaughtClass < ApplicationRecord
  
  belongs_to :user
  # has_many :students, ->{ where role: "student" }, through: :class_memberships, source: :user
  has_many :users, through: :class_memberships
  has_many :class_memberships, dependent: :destroy
  has_many :assignments, dependent: :destroy


end
