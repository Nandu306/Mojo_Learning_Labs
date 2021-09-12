class AssignmentsController < ApplicationController

  def index
    if @taught_class.present?
      @taught_class = TaughtClass.find(params[:taught_class_id])
      @assignments = policy_scope(Assignment.includes(:taught_class)).where(taught_class: @taught_class)
    else
       @assignments = policy_scope(Assignment.includes(:taught_class))

    end

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
      redirect_to taught_class_assignments_path(@taught_class), notice: "Assignment successfully created"
    else
      render :new
    end

  end


  private

  def assignment_params
    params.require(:assignment).permit(:topic, :deadline)
  end

end
