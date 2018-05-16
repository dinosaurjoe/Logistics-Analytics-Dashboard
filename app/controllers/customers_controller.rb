class CustomersController < ApplicationController
  before_action :find_shop

  def index
    @customers = @shop.customers
  end

  def oldest
    @customers = @shop.customers.order(:created_at).reverse
  end

  def newest
    @customers = @shop.customers.order(:created_at)
  end

  def mostactive
    @customers = @shop.customers.order('requests_count DESC')
  end

  private

  def find_shop
    @shop = Shop.find(params[:shop_id])
  end

end
