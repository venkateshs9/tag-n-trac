class Role < ApplicationRecord
  scopify
  #=====Constants=====================================

  ROLES = %w(customer delivery_partner).freeze
  ROLE_ADMIN = 'admin'.freeze
  ROLE_CUSTOMER = 'customer'.freeze
  ROLE_DELIVERY_PARTNER = 'delivery_partner'.freeze

  #=====Associations==================================

  belongs_to :resource, :polymorphic => true, :optional => true
  has_and_belongs_to_many :users, :join_table => :users_roles

  #=====Validations===================================


  validates :resource_type, :inclusion => { :in => Rolify.resource_types }, 
            :allow_nil => true

  #=====Callbacks=====================================

  #=====Scopes========================================

  #=====Class Methods=================================

  #=====Instance Methods==============================
end
