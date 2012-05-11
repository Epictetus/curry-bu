FactoryGirl.define do

  factory :user do
    username "test user"
    password "test user"
    password_confirmation "test user"
  end

  factory :shop do
    name "test shop"
    create_user_id 1
    update_user_id 1
  end

end
