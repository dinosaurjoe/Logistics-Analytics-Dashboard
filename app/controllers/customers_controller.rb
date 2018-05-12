class CustomersController < ApplicationController
  before_action :find_shop

  def index
    @customers = @shop.customers
      respond_to do |format|
         format.js  #-> app/views/controller/index.js.erb
         format.html
      end
  end

  private

  def find_shop
    @shop = Shop.find(params[:shop_id])
  end

end
