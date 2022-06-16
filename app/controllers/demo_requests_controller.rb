class DemoRequestsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def new
    @demo_request = DemoRequest.new
  end

  def create
    @demo_request = DemoRequest.new(params[:demo_request])
    @demo_request.request = request
    if @demo_request.deliver
      flash.now[:success] = 'Message sent!'
    else
      flash.now[:error] = 'Could not send message'
      render :new
    end
  end
end
