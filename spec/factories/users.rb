FactoryGirl.define do
  factory :user do
    sequence(:mail) { |n| "testuser#{n}@example.com" }
    sequence(:login_name) { |n| "testuser#{n}" }
    password "password"
    password_confirmation "password"
  end
end
