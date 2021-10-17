class Assignment < ApplicationRecord

  include Abyme::Model

  belongs_to :taught_class
  has_many :questions, dependent: :destroy, inverse_of: :assignment
  has_many :student_answers, through: :questions
  has_many :options, through: :questions
  has_many :class_memberships, through: :taught_class, source: :class_memberships
  has_many :completed_assignments

  accepts_nested_attributes_for :completed_assignments
  accepts_nested_attributes_for :student_answers, allow_destroy: true

  abymize :questions
  abymize :options


  enum status: [:published, :unpublished]

  validates :topic, presence: true
  validates :deadline, presence: true

  # def score
  #   score = 0
  #   score += studentanswer.question_score
  # end

  def student_percentage_completed
    percentage = ((self.completed_assignments.size).fdiv(self.taught_class.class_memberships.size) * 100).round(0)
    p "#{ percentage }%"
  end


end
