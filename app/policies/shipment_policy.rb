class ShipmentPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      return scope.all if user.has_role?(:admin)
      return scope.customer_shipments(user) if user.has_role?(:customer)
      return scope.delivery_partner_shipments(user) if user.has_role?(:delivery_partner)

      scope.none
    end
  end
end
