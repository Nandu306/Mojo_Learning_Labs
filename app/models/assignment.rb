class Assignment < ApplicationRecord

  belongs_to :taught_class
  has_many :questions, dependent: :destroy
  has_many :student_answers, through: :questions
  has_many :class_memberships, through: :taught_class, source: :class_memberships

  enum status: [:completed, :in_progress, :not_started]

  validates :topic, presence: true
  validates :deadline, presence: true

  # def score
  #   score = 0
  #   score += studentanswer.question_score
  # end




end
