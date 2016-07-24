FactoryGirl.define do
  factory :steel_type, class: SteelType do
    steel_type 'Mig307Si'
    cost 2.82
  end

  factory :steel_finish do
    cost 0.1
    finish 'Gloss'
  end

  factory :steel_width do
    width 0.8
    cost 0.2
  end

  factory :item, class: Item do
    price_kg 3.12
    volume 1000
    steel_type
    steel_finish
    steel_width
    order
  end

  factory :order do

    factory :order_with_items do
      transient do
        items_count 1
      end

      after(:create) do |order, evaluator|
        create_list(:item, evaluator.items_count, order: order, volume: 1000)
      end
    end
  end
end
