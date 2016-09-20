require 'rails_helper'

describe Item, type: :model do
  let!(:item) { FactoryGirl.create(:item) }

  describe 'belongs' do
    it { is_expected.to belong_to :order }
    it { is_expected.to belong_to :steel_type }
    it { is_expected.to belong_to :steel_finish }
    it { is_expected.to belong_to :steel_width }
    it { is_expected.to belong_to :steel_grade }
  end

  describe 'validations' do
    it 'does not validate if the various steel types have been selected' do
      invalid_item = Item.new
      expect(invalid_item).not_to be_valid
    end

    it 'does not validate if the volume is missing' do
      invalid_item = Item.create(steel_type_id: 1, steel_grade_id: 1, steel_finish_id: 1, steel_width_id: 1)
      expect(invalid_item).not_to be_valid
    end

    it 'does not validate if volume is under 100' do
      invalid_item = Item.create(steel_type_id: 1, steel_grade_id: 1, steel_finish_id: 1, steel_width_id: 1, volume: 90)
      expect(invalid_item).not_to be_valid
    end

    it 'requires steel components and volume to be valid' do
      expect(item).to be_valid
    end
  end

  describe '#add_price_kg' do
    it 'adds the price_kg to the item' do
      item.add_price_kg
      item.save!
      expect(item.price_kg).to eq(3.12)
    end
  end

  describe '#cost' do
    it 'returns the price per kg multiplied with the volume' do
      item.add_price_kg
      expect(item.cost).to eq(3120)
    end
  end

  describe '#price_kg' do
    it 'calculates the price_kg based on params' do
      params = {
        'steel_grade_id' => SteelGrade.all.first.id,
        'steel_width_id' => SteelWidth.all.first.id,
        'steel_finish_id' => SteelFinish.all.first.id
      }
      price_kg = Item.price_kg(params)

      expect(price_kg).to eq(3.12)
    end

    it 'returns the 0 if an option is missing' do
      missing_params = {
        'steel_grade_id' => SteelGrade.all.first.id,
        'steel_width_id' => SteelWidth.all.first.id,
        'steel_finish_id' => ''
      }
      price_kg = Item.price_kg(missing_params)

      expect(price_kg).to eq(0)
    end
  end
end
