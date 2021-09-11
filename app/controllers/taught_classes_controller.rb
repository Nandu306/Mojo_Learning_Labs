class TaughtClassesController < ApplicationController


  def index
    @taught_class = policy_scope(TaughtClass)
  end

  def new
    @taught_class = TaughtClass.new

  end


  def create
    @taught_class = TaughtClass.new(params[:taught_class])
    @taught_class.save
    authorize @taught_class
  end


end
