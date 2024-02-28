class User < ApplicationRecord
  rolify

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  #=====Constants=====================================

  ADMIN = 'admin'.freeze
  CUSTOMER = 'customer'.freeze
  DELIVERY_PARTNER = 'delivery_partner'.freeze

  #=====Associations==================================

  has_many :customer_shipments, class_name: 'Shipment',
                                foreign_key: 'customer_id'
  has_many :delivery_partner_shipments, class_name: 'Shipment',
                                        foreign_key: 'delivery_partner_id'

  #=====Validations===================================

  #=====Callbacks=====================================

  after_create :assign_role

  #=====Scopes========================================

  #=====Class Methods=================================

  #=====Instance Methods==============================

  def role
    return Role::ROLE_CUSTOMER.to_s if user_type == CUSTOMER

    Role::ROLE_DELIVERY_PARTNER.to_s
  end

  def admin?
    user_type == ADMIN
  end

  def customer?
    user_type == CUSTOMER
  end

  private

  def assign_role
    self.add_role(role) if self.roles.blank?
  end
end
