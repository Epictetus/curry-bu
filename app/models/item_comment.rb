class ItemComment < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :item
  belongs_to :user

  validates :item_id, presence: true
  validates :user_id, presence: true
  validates :comment,
    presence: true,
    length: { maximum: 1000 }

  attr_accessible :comment
end
