FactoryGirl.define do

  factory :user do
    sequence(:login_name) { |n| "testuser#{n}" }
    password "test user"
    password_confirmation "test user"
  end

  factory :shop do
    sequence(:name) { |n| "test shop#{n}" }
    association :create_user, factory: :user
    association :update_user, factory: :user
  end

end
