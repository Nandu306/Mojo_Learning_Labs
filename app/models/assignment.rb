class Assignment < ApplicationRecord

  belongs_to :taught_class
  has_many :questions, dependent: :destroy

  enum status: [:completed, :in_progress, :not_started]

  validates :topic, presence: true
  validates :deadline, presence: true


end
