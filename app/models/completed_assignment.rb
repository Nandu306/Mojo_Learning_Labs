class CompletedAssignment < ApplicationRecord
  belongs_to :user
  belongs_to :assignment
  has_many :student_answers, dependent: :destroy

  accepts_nested_attributes_for :student_answers
end
