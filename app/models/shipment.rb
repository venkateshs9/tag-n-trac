class Shipment < ApplicationRecord
  #=====Constants=====================================

  STATUS_SHIPPED = 'Shipped'.freeze
  STATUS_IN_TRANSIST = 'In Transist'.freeze
  STATUS_DELIVERED = 'Delivered'.freeze

  #=====Associations==================================

  belongs_to :customer, class_name: 'User'
  belongs_to :delivery_partner, class_name: 'User', optional: true

  #=====Validations===================================

  #=====Callbacks=====================================

  after_create :auto_asign_delivery_partner

  #=====Scopes========================================

  scope :customer_shipments, ->(user) { where(customer_id: user.id) }
  scope :delivery_partner_shipments, ->(user) { where(delivery_partner_id: user.id) }

  #=====Class Methods=================================

  #=====Instance Methods==============================

  private

  def auto_asign_delivery_partner
    AutoAssignDeliveryPartner.new(shipment: self).call
  end
end
