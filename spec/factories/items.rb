# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    sequence(:title){ |n| "Test Title #{n}"}
    comment "test comment"
    image { File.open(File.join(Rails.root, 'spec', 'support', 'items', 'image.jpg')) }
    price "12345"
    ate_at "2012-05-25"
    user
    shop
  end
end
