class QuestionsController < ApplicationController

  def new
    @assignment = Assignment.find(params[:assignment_id])

    @question = Question.new

    4.times { @question.student_answers.build }

    authorize @question

  end


  def create
    @assignment = Assignment.find(params[:assignment_id])
    @question = Question.new(question_params)
    @question.assignment_id = @assignment.id
    @question.assignment = @assignment
    authorize @question

    if @question.save
      redirect_to new_assignment_question_path(@assignment)
    else
      render :new
    end

  end


  private

  def question_params
    params.require(:question).permit(:assignment_id, :prompt, :option_1, :option_2, :option_3, :option_4, :answer, student_answer_attributes: [:id, :student_answer])

  end

end
