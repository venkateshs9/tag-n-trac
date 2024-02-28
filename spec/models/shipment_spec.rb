require 'rails_helper'

RSpec.describe Shipment, type: :model do
  #=====Constants=====================================

  it { expect(described_class::STATUS_SHIPPED).to eql('Shipped') }
  it { expect(described_class::STATUS_IN_TRANSIST).to eql('In Transist') }
  it { expect(described_class::STATUS_DELIVERED).to eql('Delivered') }

  #=====Associations==================================

  it { should belong_to(:customer).class_name('User') }
  it { should belong_to(:delivery_partner).class_name('User').optional }

  #=====Validations===================================

  #=====Callbacks=====================================

  #=====Scopes========================================

  describe '#customer_shipments' do
    context 'Should return customer shipments' do
      let!(:customer) { Fabricate(:user, user_type: 'customer') }
      let!(:shipment_1) { Fabricate(:shipment, customer_id: customer.id) }
      let(:shipment_2) { Fabricate(:shipment) }
      let!(:shipment_3) { Fabricate(:shipment, customer_id: customer.id) }

      it 'with customer' do
        expect(described_class.customer_shipments(customer))
                              .to match_array([shipment_1, shipment_3])
      end
    end
  end

  describe '#delivery_partner_shipments' do
    context 'Should return delivery_partner shipments' do
      let!(:delivery_partner) { Fabricate(:user, user_type: 'delivery_partner') }
      let!(:shipment_1) { Fabricate(:shipment, delivery_partner_id: delivery_partner.id) }
      let!(:shipment_2) { Fabricate(:shipment, delivery_partner_id: delivery_partner.id) }
      let(:shipment_3) { Fabricate(:shipment) }

      it 'with customer' do
        expect(described_class.delivery_partner_shipments(delivery_partner))
                              .to match_array([shipment_1, shipment_2])
      end
    end
  end

  #=====Class Methods=================================

  #=====Instance Methods==============================
end
