FactoryGirl.define do
  factory :user do
    sequence(:login_name) { |n| "testuser#{n}" }
    password "password"
    password_confirmation "password"
  end
end
