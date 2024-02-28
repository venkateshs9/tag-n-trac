class ShipmentCreation
  STATUS = 'Yet to ship'.freeze

  def initialize(user:, params:)
    @user = user
    @params = params
  end

  def call
    Shipment.create!(new_shipment_attributes)
  end

  private

  attr_reader :user, :params

  def new_shipment_attributes
    params.merge(customer_id: user.id, status: STATUS)
  end
end
