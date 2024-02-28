class AutoAssignDeliveryPartner
  def initialize(shipment:)
    @shipment = shipment
  end

  def call
    shipment.update(delivery_partner_id: delivery_partner.id)
  end

  private

  attr_reader :shipment

  def delivery_partners
    User.where(user_type: User::DELIVERY_PARTNER)
  end

  def delivery_partner
    delivery_partners.sample
  end
end
