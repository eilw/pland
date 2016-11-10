FactoryGirl.define do
  factory :steel_type do
    steel_type 'MIG'
  end

  factory :steel_grade do
    grade '307Si'
    cost 2.82
    steel_type
  end

  factory :steel_finish do
    cost 0.1
    finish 'Brillante'
  end

  factory :steel_width do
    width 0.8
    cost 0.2
    steel_type
  end

  factory :item, class: Item do
    price_kg 3.12
    volume 1000
    steel_type
    steel_grade
    steel_finish
    steel_width
    order
  end
end
