class CompletedAssignment < ApplicationRecord
  belongs_to :user
  belongs_to :assignment, counter_cache: true
  has_many :student_answers, dependent: :destroy

  accepts_nested_attributes_for :student_answers

  def score
    score = 0
    student_answers.includes(:question, :option).each do |student_answer|
      score += 1 if student_answer.question.answer == student_answer.option.content
    end
    p score.fdiv(assignment.questions.size) * 100
  end
end
