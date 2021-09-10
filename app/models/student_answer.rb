class StudentAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :question


  def correct
    self.student_answer == question.answer
  end

  def question_score
    correct ? 1 : 0
  end

end
