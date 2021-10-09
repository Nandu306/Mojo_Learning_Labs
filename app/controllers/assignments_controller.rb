class AssignmentsController < ApplicationController

  def index

    @taught_class = TaughtClass.find(params[:taught_class_id])
    @assignments_set = policy_scope(Assignment.includes(:taught_class)).where(taught_class: @taught_class)

  end


  def new
    @taught_class = TaughtClass.find(params[:taught_class_id])
    @assignment = Assignment.new
    @assignment.taught_class = @taught_class
    # @assignment.questions.build
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


  # def publish
  #   @assignment = Assignment.find(params[:id])
  #   authorize @assignment

  #   if @assignment.update(status: 'published')
  #     redirect_to taught_classes_path, notice: "Assignment published"
  #   else
  #     puts @assignment.errors.full_messages
  #     render :new
  #   end

  # end


  #  def submit_answer
  #   @assignment = Assignment.find(params[:id])
  #   @student_answer = @assignment.student_answers.build

  #   @assignment.questions.each do |question|
  #     @student_answer.student_answers.build(question_id: question.id)
  #   end

  #   if @assignment.update
  #     redirect_to taught_classes_path, notice: "Assignment published"
  #   else
  #     render :new
  #   end

  # end

  def new_completed_assignment


  end


  def create_completed_assignment


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

end
