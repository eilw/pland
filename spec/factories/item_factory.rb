FactoryGirl.define do

  factory :item, class: Item do
    price_kg 1.00
    volume 1000
    steel_type_id 1
    steel_finish_id 1 
    steel_width_id 1
    order
  end

  factory :order do

    factory :order_with_items do
      transient do
        items_count 1
      end

      after(:create) do |order, evaluator|
        create_list(:item, evaluator.items_count, order: order, volume: 1000, steel_type_id: 1, steel_finish_id: 1, steel_width_id: 1)
      end
    end
  end
end
