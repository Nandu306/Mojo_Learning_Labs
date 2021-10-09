class StudentAnswer < ApplicationRecord

  belongs_to :completed_assignment
  belongs_to :question
  belongs_to :option




  def correct
    self.student_answer == question.answer
  end

  def question_score
    correct ? 1 : 0
  end

end
