require 'rails_helper'

describe Order, type: :model do
  let(:order_with_items) { FactoryGirl.create(:order_with_items) }
  let(:order_without_items) { FactoryGirl.create(:order) }

  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many(:items).dependent(:destroy) }
  end

  describe '#cost_transport' do
    it 'returns the value of the transport cost' do
      order_with_items.transport_type = 'CIF'
      transport_cost = 450

      expect(order_with_items.cost_transport).to eq(transport_cost)
    end
  end

  describe '#cost_total' do
    it 'returns the total cost of the order' do
      order_with_items.transport_type = 'CIF'
      total_cost = 3570

      expect(order_with_items.cost_total).to eq(total_cost)
    end
  end

  describe '#complete?' do
    context 'order is complete' do
      it 'is complete if items are over 1000kg in volume and has a transport type' do
        order_with_items.transport_type = 'CIF'
        expect(order_with_items.complete?).to be_truthy
      end
    end

    context 'order is not complete' do
      it 'is incomplete if items not over 1000kg in volume' do
        order_without_items.transport_type = 'CIF'
        expect(order_without_items.complete?).to be_falsey
      end

      it 'is incomplete if transport type not selected' do
        expect(order_with_items.complete?).to be_falsey
      end
    end
  end

  describe '#total_volume' do
    xit 'returns the total volume of the order' do
    end
  end
end
