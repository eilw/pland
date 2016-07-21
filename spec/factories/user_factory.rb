FactoryGirl.define do
  factory :user, class: User do
    email 'test@test.com'
    password '123456'
    created_at Time.now
    updated_at Time.now

    trait :approved do
      approved true
    end

    trait :admin do
      email 'admin@email.com'
      approved true
      admin true
    end
  end
end
