require 'rails_helper'

describe Order, type: :model do
  let(:order_with_items) { FactoryGirl.create(:order_with_items) }
  let(:order_complete) { FactoryGirl.create(:order_complete_with_items) }
  let(:order_without_items) { FactoryGirl.create(:order) }

  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many(:items).dependent(:destroy) }
  end

  describe '#cost_transport' do
    it 'returns the value of the transport cost' do
      transport_cost = 450

      expect(order_complete.cost_transport).to eq(transport_cost)
    end
  end

  describe '#cost_total' do
    it 'returns the total cost of the order' do
      total_cost = 3570

      expect(order_complete.cost_total).to eq(total_cost)
    end
  end

  describe '#complete?' do
    context 'order is complete' do
      it 'is complete if items are over 1000kg in volume and has a transport type' do
        expect(order_complete.complete?).to be_truthy
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
    it 'returns the total volume of the order' do
      expect(order_with_items.total_volume).to eq(1000)
    end

    it 'returns 0 if there are no items' do
      expect(order_without_items.total_volume).to eq(0)
    end
  end
end
