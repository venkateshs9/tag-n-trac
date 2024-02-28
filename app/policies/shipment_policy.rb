class ShipmentPolicy < ApplicationPolicy
  class Scope
    def resolve
      byebug
      return scope.all if user.has_role?(:admin)
      return scope.customer_shipments if user.has_role?(:customer)
      return scope.delivery_partner_shipments if user.has_role?(:delivery_partner)

      scope.none
    end
  end
end
