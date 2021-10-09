class CompletedAssignment < ApplicationRecord
  belongs_to :user
  belongs_to :assignment
  has_many :student_answers, dependent: :destroy

  accepts_nested_attributes_for :student_answers

  def score
    score = 0
    self.student_answers.each do |student_answer|
      score += 1 if student_answer.question.answer == student_answer.option.content
    end
    p "#{(score.fdiv(self.assignment.questions.size) * 100)} %"
  end

end