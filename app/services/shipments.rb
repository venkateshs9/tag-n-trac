class Shipments
  def initialize(user:)
    @user = user
  end

  def call
    user.customer_shipments
  end

  private

  attr_reader :user
end
