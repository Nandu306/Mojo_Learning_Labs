class Option < ApplicationRecord
  belongs_to :question
  has_many :student_answers, dependent: :destroy
  accepts_nested_attributes_for :student_answers

  validates :content, presence: true
end
