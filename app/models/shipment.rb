class Shipment < ApplicationRecord
  #=====Constants=====================================

  #=====Associations==================================

  belongs_to :customer, class_name: 'User'
  belongs_to :delivery_partner, class_name: 'User', optional: true

  #=====Validations===================================

  #=====Callbacks=====================================

  #=====Scopes========================================

  #=====Class Methods=================================

  #=====Instance Methods==============================
end
