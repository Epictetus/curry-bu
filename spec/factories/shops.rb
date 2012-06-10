FactoryGirl.define do
  factory :shop do
    sequence(:name) { |n| "test shop#{n}" }
    sequence(:url) { |n| "http://#{n}.com" }
    association :create_user, factory: :user
    association :update_user, factory: :user
  end
end
