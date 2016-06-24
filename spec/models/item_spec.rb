require 'rails_helper'

describe Item, type: :model do
  it { is_expected.to belong_to :order }
  it { is_expected.to belong_to :steel_type }
  it { is_expected.to belong_to :steel_finish }
  it { is_expected.to belong_to :steel_width }

  describe '#calculate_price' do
    it 'returns the cost of the various options' do
     # steel_type = FactoryGirl.create(:steel_type, cost: 1)
     # steel_finish = FactoryGirl.create(:steel_finish, cost: 10)
     # steel_width = FactoryGirl.create(:steel_width, cost: 100)

      item = Item.create(steel_type_id: 1, steel_finish_id: 1, steel_width_id: 1)
      expect(item.calculate_price).to eq(3.02)
    end
  end

  describe '#cost' do
    it 'returns the price per kg multiplied with the volume' do
      item = Item.create(steel_type_id: 1, steel_finish_id: 1, steel_width_id: 1, volume: 1)
      item.price_kg = item.calculate_price
      expect(item.cost).to eq(3.02)
    end
  end

end
