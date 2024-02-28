class DashboardController < ApplicationController
  def dashboard
    @user = current_user
    byebug
    @shipments = ShipmentPolicy::Scope.new(current_user, Shipment).resolve
    byebug
  end
end
