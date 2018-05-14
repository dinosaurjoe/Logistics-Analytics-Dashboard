class ShopsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_shop, only: [:show, :edit, :update, :destroy]

  def index
    @shops = current_user.shops
  end

  def show

    @shipments = @shop.shipments
  end

  def edit
    authorize @shop
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = current_user.shops.build(shop_params)

    if @shop.save
      # flash[:success] = "Your project was created. Now add some images."
      redirect_to shop_path(@shop)
    else
      flash[:alert] = @shop.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    authorize @shop

    if @shop.update_attributes(shop_params)
      redirect_to shop_path(@shop)
    else
      flash[:alert] = "Unable to update project. #{@shop.errors.full_messages.to_sentence}"
      redirect_to :edit
    end
  end

  def destroy
    authorize @shop

    if @shop.destroy
      redirect_to shops_path, notice: "Shop deleted."
    else
      redirect_to shops_path, notice: "Unable to delete shop."
    end
  end

  private

  def find_shop
    @shop = Shop.find(params[:id])
    authorize @shop
  end

  def shop_params
    params.require(:shop).permit(:name)
  end
end
