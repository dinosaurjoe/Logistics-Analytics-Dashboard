class FreightCapacitiesController < ApplicationController
  before_action :find_freight_capacity
  before_action :find_shipment


  def show
      respond_to do |format|
         format.js  #-> app/views/controller/index.js.erb
         format.html
      end
  end

private
  def find_shipment
    @shipment = Shipment.find(params[:shipment_id])
  end

  def find_freight_capacity
    @freight_capacity = FreightCapacity.find(params[:id])
  end

  def freight_capacity_params
    params.require(:freight_capacity).permit(:shipment_id, :transportation_type, :container_size, :service_value, :volume)
  end
end
