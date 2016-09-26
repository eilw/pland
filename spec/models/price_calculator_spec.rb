require 'rails_helper'

describe PriceCalculator do
  let(:calculator) { described_class.new }

  before(:each) do
    # Populates steel items to be used
    FactoryGirl.create(:item)
  end

  describe '#price_kg' do
    it 'calculates the price_kg based on params' do
      price_kg = calculator.price_kg(params)
      expected_price = 3.12

      expect(price_kg).to eq(expected_price)
    end

    it 'returns the 0 if an option is missing' do
      price_kg = calculator.price_kg(missing_params)

      expect(price_kg).to eq(0)
    end
  end

  describe '#item_cost' do
    it 'calculates the cost of the item based on params' do
      cost_of_item = 3120

      expect(calculator.cost(params)).to eq(cost_of_item)
    end

    it 'returns 0 if the params are not complete' do
      expect(calculator.cost(missing_params)).to eq(0)
    end
  end

  def params
    {
      'steel_grade_id' => SteelGrade.all.first.id,
      'steel_width_id' => SteelWidth.all.first.id,
      'steel_finish_id' => SteelFinish.all.first.id,
      'volume' => '1000'
    }
  end

  def missing_params
    {
      'steel_grade_id' => SteelGrade.all.first.id,
      'steel_width_id' => SteelWidth.all.first.id,
      'steel_finish_id' => '',
      'volume' => '1000'
    }
  end
end
