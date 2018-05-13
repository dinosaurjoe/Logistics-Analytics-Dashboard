class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :set_status, :destroy]
  before_action :find_user
  #before_action :set_status
  #skip_after_action :verify_authorized

  def index
    # authorize @request
    @requests = @user.requests.all
  end

  def show
    @request = Request.find(params[:id])
    @request.status(current_customer)
  end

  def set_status
    if @request.user_confirmation && @request.customer_confirmation = true
        @request.status = "Accepted"
    elsif @request.user_confirmation || @request.customer_confirmation = false
        @request.status = "Declined"
    else
        @request.status = "Open"
    end
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

  def find_user
      @user = User.find(params[:user_id])
  end


  def set_request
    @request = Request.find(params[:id])
    authorize @request
  end

  def request_params
    params.require(:request).permit(:user_confirmation, :customer_confirmation, :message, :created_by, :proposal)
  end
end
