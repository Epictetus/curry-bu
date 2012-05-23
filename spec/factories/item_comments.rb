# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item_comment do
    item nil
    comment "MyText"
    user nil
    deleted_at "2012-05-23 10:16:07"
  end
end
