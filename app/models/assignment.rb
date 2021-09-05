class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :taught_class
  has_many :questions

  enum status: [:completed, :in_progress, :not_started]

  validates :topic, presence: true
  validates :deadline, presence: true


end
