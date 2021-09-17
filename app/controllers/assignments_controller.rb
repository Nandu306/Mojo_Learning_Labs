class AssignmentsController < ApplicationController

  def index

    @taught_class = TaughtClass.find(params[:taught_class_id])
    @assignments_set = policy_scope(Assignment.includes(:taught_class)).where(taught_class: @taught_class)

      # @assignments = policy_scope(Assignment.includes(:taught_class))
  end


  def new
    @taught_class = TaughtClass.find(params[:taught_class_id])
    @assignment = Assignment.new
    @assignment.taught_class = @taught_class

    @assignment.questions.build

    authorize @assignment

  end


  def create
    @taught_class = TaughtClass.find(params[:taught_class_id])
    @assignment = Assignment.new(assignment_params)
    @assignment.taught_class = @taught_class
    authorize @assignment


    if @assignment.save
      redirect_to new_assignment_question_path(@assignment), notice: "Assignment successfully created. Please start adding questions"
    else
      render :new
    end

  end


  def publish
    @assignment = Assignment.find(params[:id])
    authorize @assignment

    if @assignment.update(status: 'in_progress')
      redirect_to taught_classes_path, notice: "Assignment published"
    else
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
    params.require(:assignment).permit(:topic, :deadline, :taught_class_id)
  end

end
