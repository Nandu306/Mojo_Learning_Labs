class StudentAnswersController < ApplicationController

  def new
    skip_authorization

    @assignment = Assignment.find(params[:assignment_id])



    @student_answer = StudentAnswer.new


  end

  def create
    skip_authorization

    @assignment = Assignment.find(params[:assignment_id])


    @student_answer = StudentAnswer.new(student_answer_params)
    @student_answer.user = current_user

    if @student_answer.save
      redirect_to root_path
    else
      render :new
    end

  end

  private

  def student_answer_params
    params.require(:student_answer).permit(:assignment_id, :question_id, :student_answer)
  end

end
