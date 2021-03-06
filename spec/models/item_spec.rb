require 'rails_helper'

describe Item, type: :model do
  let!(:item) { FactoryGirl.create(:item) }
  let(:calculator) { double('PriceCalculator') }
  let(:calculator_klass) { double('PriceCalculatorKlass', new: calculator) }

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
      allow(calculator).to receive(:price_kg) { 3.12 }

      item.add_price_kg(calculator_klass)
      item.save!

      expect(item.price_kg).to eq(3.12)
    end
  end

  describe '#cost' do
    it 'returns the price per kg multiplied with the volume' do
      allow(calculator).to receive(:price_kg) { 3.12 }

      item.add_price_kg(calculator_klass)

      expect(item.cost).to eq(3120)
    end
  end
end
