class DashboardController < ApplicationController
  def dashboard
    @user = current_user
    @shipments = ShipmentPolicy::Scope.new(current_user, Shipment).resolve
  end
end
