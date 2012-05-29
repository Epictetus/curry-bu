FactoryGirl.define do
  factory :shop do
    sequence(:name) { |n| "test shop#{n}" }
    association :create_user, factory: :user
    association :update_user, factory: :user
  end
end
