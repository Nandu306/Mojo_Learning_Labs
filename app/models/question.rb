class Question < ApplicationRecord
  belongs_to :assignment
  has_many :student_answers, dependent: :destroy

  validates :prompt, presence: true
  validates :answer, presence: true

  accepts_nested_attributes_for :student_answers


end
