class ShipmentsController < ApplicationController
  before_action :find_shop
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_shipment, only: [:show, :edit, :update, :destroy]

  def index
    @shipments = @shop.shipments
  end

  def complete
    @shipments = @shop.shipments.where(status: 'Completed')
  end

  def open
    @shipments = @shop.shipments.where(status: 'Open')
  end

  def received
    @shipments = @shop.shipments.where(status: 'Received')
  end
  def show
  end

  def edit
    authorize @shipment
  end

  def new
    @shipment = Shipment.new
  end

  def create
    @shipment = @shop.shipments.build(shipment_params)

    if @shipment.save
      # flash[:success] = "Your project was created. Now add some images."
      redirect_to @shop
    else
      flash[:alert] = @shipment.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    authorize @shipment

    if @shipment.update_attributes(shipment_params)
      redirect_to shop_path(@shop)
    else
      flash[:alert] = "Unable to update project. #{@shipment.errors.full_messages.to_sentence}"
      redirect_to :edit
    end
  end

  def destroy
    authorize @shipment

    if @shipment.destroy
      redirect_to shop_path(@shop), notice: "Shipment Canceled."
    else
      redirect_to shop_path(@shop), notice: "Unable to cancel shipment."
    end
  end

  private
   def find_shop
    @shop = Shop.find(params[:shop_id])
  end

  def find_shipment
    @shipment = Shipment.find(params[:id])
    authorize @shipment
  end

  def shipment_params
    params.require(:shipment).permit(:status, :destination, :origin)
  end
end
