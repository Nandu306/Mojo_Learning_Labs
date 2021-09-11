class Assignment < ApplicationRecord

  belongs_to :taught_class
  has_many :questions, dependent: :destroy
  has_many :student_answers, through: :questions

  enum status: [:completed, :in_progress, :not_started]

  validates :topic, presence: true
  validates :deadline, presence: true

  # def score
  #   score = 0
  #   score += studentanswer.question_score
  # end




end
