class Assignment < ApplicationRecord

  include Abyme::Model

  belongs_to :taught_class, counter_cache: true
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
  validates :note


  def student_percentage_completed
    percentage = (self.completed_assignments.size).fdiv(self.taught_class.class_memberships.size == 0 ? 1 : self.taught_class.class_memberships.size)
    p "#{ (percentage * 100).round() }%"
  end


  def class_average
    total = 0
    self.completed_assignments.each do |completed_assignment|
      total += completed_assignment.score
    end
    average = total.fdiv(self.completed_assignments.size == 0 ? 1 : self.completed_assignments.size)
    p average.round()
  end


end
