require 'rails_helper'

describe Order, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :items }

  describe 'validations' do
    xit 'all items are deleted if an order is deleted' do
      order = FactoryGirl.create(:order_with_items)
      Order.delete(order)
      expect(item).to eq(nil)
    end
  end
  
  describe "#cost_transport" do
    it 'returns the value of the transport cost' do
      order = FactoryGirl.create(:order_with_items)
      expect(order.cost_transport).to eq(450)
    end
  end

  describe "#cost_total" do
    it 'returns the total cost of the order' do
      order = FactoryGirl.create(:order_with_items)
      expect(order.cost_total).to eq(1450)
    end
  end

 
end
