class DemoRequestsController < ApplicationController

  def new
    skip_authorization
    @demo_request = DemoRequest.new
  end

  def create
    skip_authorization
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
