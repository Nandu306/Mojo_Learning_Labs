class ClassMembershipsController < ApplicationController

  # def new
  #   @class_membership = ClassMembership.new
  #   authorize @class_membership

  # end

  def index
    @class_memberships = policy_scope(ClassMembership).where(user: current_user)
  end


  def create
    @taught_class = TaughtClass.find(params[:taught_class_id])
    @class_membership = ClassMembership.new
    @class_membership.user = current_user
    @class_membership.taught_class = @taught_class
    authorize @class_membership

    if @class_membership.save
      redirect_to taught_classes_path(@taught_class)
      flash[:alert] = "You've now joined the class"
    end
  end

end
