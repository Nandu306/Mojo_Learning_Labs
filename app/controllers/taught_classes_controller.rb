class TaughtClassesController < ApplicationController


  def index
    @taught_classes = policy_scope(TaughtClass).where(user: current_user)
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
      redirect_to taught_classes_path
    else
      render :new
    end

  end


  private

  def taughtclass_params
    params.require(:taught_class).permit(:year, :subject, :academic_year, { studentlist: [] })
  end


end
