class Question < ApplicationRecord
  belongs_to :assignment
  has_many :student_answers

  validates :prompt, presence: true
  validates :answer, presence: true




end
