class AssignmentsController < ApplicationController

  def index

    @taught_class = TaughtClass.find(params[:taught_class_id])
    @assignments_set = policy_scope(Assignment.includes(:taught_class)).where(taught_class: @taught_class)

  end


  def new
    @taught_class = TaughtClass.find(params[:taught_class_id])
    @assignment = Assignment.new
    @assignment.taught_class = @taught_class

    authorize @assignment

  end


  def create
    @taught_class = TaughtClass.find(params[:taught_class_id])
    @assignment = Assignment.new(assignment_params)
    @assignment.taught_class = @taught_class
    authorize @assignment


    if @assignment.save
      redirect_to root_path
    else
      puts @assignment.errors.full_messages
      render :new
    end

  end

  def edit
    skip_authorization
    @assignment = Assignment.find(params[:id])

  end

  def update
    skip_authorization
    @assignment = Assignment.find(params[:id])

     if @assignment.update(assignment_params)
      redirect_to taught_classes_path
    else
      render :edit
    end

  end


  def new_completed_assignment
    skip_authorization
    @assignment = Assignment.find(params[:id])
    @completed_assignment = @assignment.completed_assignments.build

    @assignment.questions.each do |question|
      @completed_assignment.student_answers.build(question: question)
    end


  end


  def create_completed_assignment
    skip_authorization
    @assignment = Assignment.find(params[:id])
    @completed_assignment = @assignment.completed_assignments.build(completed_assignment_params)
    @completed_assignment.user = current_user

    if @completed_assignment.save
      redirect_to root_path
    else
      puts @completed_assignment.errors.full_messages
      render :new
    end

  end



  def my_assignments
    skip_authorization
    @class_memberships = current_user.class_memberships
  end


  def show
    @assignment = Assignment.find(params[:id])
    authorize @assignment

  end


  private

  def assignment_params
    params.require(:assignment).permit(
      :topic,
      :deadline,
      :taught_class_id,
      questions_attributes:
      [
        :id,
        :prompt,
        :_destroy,
        options_attributes: [:id, :content, :_destroy]
      ]
        )
  end


  def completed_assignment_params
    params.require(:completed_assignment).permit(student_answers_attributes: [:assignment_id, :question_id, :option_id])
  end

end
