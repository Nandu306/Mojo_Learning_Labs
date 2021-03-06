class TaughtClassesController < ApplicationController


  def index
    if current_user.teacher?
      @taught_classes = policy_scope(TaughtClass.includes(:user)).where(user: current_user)
    elsif current_user.student?
      @taught_classes = policy_scope(TaughtClass.includes(:user))
    end
  end

  def new
    @taught_class = TaughtClass.new
    authorize @taught_class

  end


  def create
    @taught_class = TaughtClass.new(taughtclass_params)
    @taught_class.user = current_user
    authorize @taught_class


    if @taught_class.save
      redirect_to dashboard_path
    else
      render :new
    end

  end


  def class_students
    @taught_class = TaughtClass.find(params[:taught_class_id])
    @class_students = @taught_class.class_memberships
    authorize @taught_class
  end

   def destroy
    @taught_class = TaughtClass.find(params[:id])
    if @taught_class.destroy
      redirect_to dashboard_path
      flash[:alert] = "You've now deleted the class"
    end
    authorize @taught_class
  end


  private

  def taughtclass_params
    params.require(:taught_class).permit(:year, :subject, :academic_year)
  end


end
