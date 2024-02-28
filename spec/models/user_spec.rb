require 'rails_helper'

RSpec.describe User, type: :model do
  #=====Constants=====================================

  it { expect(described_class::ADMIN).to eql('admin') }
  it { expect(described_class::CUSTOMER).to eql('customer') }
  it { expect(described_class::DELIVERY_PARTNER).to eql('delivery_partner') }

  #=====Associations==================================

  it { is_expected.to have_many(:customer_shipments).class_name('Shipment') }
  it { is_expected.to have_many(:delivery_partner_shipments).class_name('Shipment') }

  #=====Validations===================================

  #=====Callbacks=====================================

  describe '#assign_role' do
    context 'Should assign role' do
      let(:user) { Fabricate.build(:user, user_type: 'customer') }

      before { user.save }

      it 'with customer user' do
        expect(user.roles.last.name).to eq('customer')
      end
    end
  end

  #=====Scopes========================================

  #=====Class Methods=================================

  #=====Instance Methods==============================

  describe '.role' do
    context 'should return user role' do
      let(:admin_role) { 'admin' }
      let(:customer_role) { 'customer' }
      let(:delivery_partner_role) { 'delivery_partner' }
      let(:admin_user) { Fabricate(:user, user_type: 'admin') }
      let(:customer_user) { Fabricate(:user, user_type: 'customer') }
      let(:delivery_partner_user) { Fabricate(:user, user_type: 'delivery_partner') }

      it 'when admin' do
        expect(admin_user.role).to eq admin_role.to_s
      end

      it 'when customer' do
        expect(customer_user.role).to eq customer_role.to_s
      end

      it 'when delivery_partner' do
        expect(delivery_partner_user.role).to eq delivery_partner_role.to_s
      end
    end
  end

  describe '.admin?' do
    context 'should check admin' do
      let(:user) { Fabricate(:user, user_type: 'admin') }
      let(:customer_user) { Fabricate(:user, user_type: 'customer') }

      it 'when admin user' do
        expect(user.admin?).to be_truthy
      end

      it 'when customer user' do
        expect(customer_user.admin?).not_to be_truthy
      end
    end
  end

  describe '.customer?' do
    context 'should check customer' do
      let(:user) { Fabricate(:user, user_type: 'customer') }

      it 'with customer user' do
        expect(user.customer?).to be_truthy
      end
    end
  end
end
