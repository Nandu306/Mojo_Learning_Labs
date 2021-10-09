class Question < ApplicationRecord

  include Abyme::Model

  belongs_to :assignment
  has_many :student_answers, dependent: :destroy
  has_many :options, dependent: :destroy

  validates :prompt, presence: true
  # validates :answer, presence: true

  accepts_nested_attributes_for :student_answers

  abymize :options


end
