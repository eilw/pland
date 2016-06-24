FactoryGirl.define do

  factory :item, class: Item do
    price_kg 1.00
    volume 1000
    order
  end

  factory :order do

    factory :order_with_items do
      transient do
        items_count 1
      end

      after(:create) do |order, evaluator|
        create_list(:item, evaluator.items_count, order: order)
      end
    end
  end
end
