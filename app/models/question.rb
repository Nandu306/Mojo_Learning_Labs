class Question < ApplicationRecord
  include Abyme::Model

  belongs_to :assignment
  has_many :student_answers, dependent: :destroy
  has_many :options, dependent: :destroy

  accepts_nested_attributes_for :student_answers

  validates :prompt, presence: true
  validates :answer, presence: true

  has_one_attached :photo

  abymize :options

  def question_score
    score = 0
    student_answers.includes(:question).each do |student_answer|
      score += 1 if student_answer.question.answer == student_answer.option.content
    end
    p score
  end
end
