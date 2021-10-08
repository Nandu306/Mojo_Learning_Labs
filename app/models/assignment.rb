class Assignment < ApplicationRecord

  include Abyme::Model

  belongs_to :taught_class
  has_many :questions, dependent: :destroy, inverse_of: :assignment
  has_many :student_answers, through: :questions
  has_many :options, through: :questions
  has_many :class_memberships, through: :taught_class, source: :class_memberships

  # accepts_nested_attributes_for :questions, allow_destroy: true

  abymize :questions
  abymize :options


  enum status: [:published, :unpublished]

  validates :topic, presence: true
  validates :deadline, presence: true

  # def score
  #   score = 0
  #   score += studentanswer.question_score
  # end




end
