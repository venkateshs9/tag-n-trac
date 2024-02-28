class ShipmentsController < ApplicationController
  def new
    @user = current_user
  end

  def create
    ShipmentCreation.new(user: current_user, params: shipment_params).call
    redirect_to dashboard_path
  rescue Exception
    render 'new'
  end

  private

  def shipment_params
    params.permit(:item, :source, :destination)
  end
end
