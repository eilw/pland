FactoryGirl.define do
  factory :order do
    print_label false
    association :user
  end

  factory :order_with_items, class: Order do
    before(:create) { FactoryGirl.create(:transport_type) }
    after(:create) do |order, evaluator|
      create_list(:item, evaluator.items_count, order: order, volume: 1000)
    end

    association :user
    transport_type 'CIF'
    transient do
      items_count 1
    end
  end
end
