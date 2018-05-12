class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy, :accept]
  skip_after_action :verify_authorized

  def index
    authorize @request
    @request = Request.all
  end

  def show
    @request = Request.find(params[:id])
    @request.status(current_customer)
  end

  def new
    @request = Request.new
    @request.user_confirmation = true
    @request.created_by = current_customer
    authorize @request
  end

  def create
    @request = Request.new(request_params)
    @request.created_by = current_customer
    @request.user = current_customer
    authorize @request
    @request.save
    if @request.save!
      redirect_to dashboard_path
    else
      redirect_to new_request_path(@request)
      # path unclear
    end
  end

  def decline
    authorize @request
    if current_user == @request.project.owner
      @request.user_confirmation == false
      Pusher.trigger("user-#{@request.user.id}-#{Rails.env}", 'status', {
        message: "Your request was declined :("
    })
    else
      @request.user_confirmation == false
      Pusher.trigger("user-#{@request.user.id}-#{Rails.env}", 'status', {
        message: "Your request was declined :("
      })
    end

  end

  def accept
    Pusher.trigger("user-#{@request.user.id}-#{Rails.env}", 'status', {
      message: "accept"
    })
    authorize @request

    @request.customer_confirmation = true
    @request.user_confirmation = true
    @request.save

    #"#{@request.role.project.owner.first_name} accepted your request to join #{@request.role.project.title}"
    redirect_to dashboard_path
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
  end

  def update
    @request = Request.find(params[:id])
    params[:commit] =="accept" ? @request.user_confirmation = true : @request.user_confirmation = false
    @request.destroy if params[:commit] == "decline"
    redirect_to dashboard_path
  end

  private

  def set_request
    @request = Request.find(params[:id])
    authorize @request
  end

  def request_params
    params.require(:request).permit(:user_confirmation, :customer_confirmation, :message, :created_by, :proposal)
  end
end
