class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop
  mount_uploader :image, ItemUploader

  validates :title, presence: true
  validates :image, presence: true
  validates :ate_at, presence: true
  validates :shop, presence: true
  validates :price, numericality: { only_integer: true, allow_nil: true }
end
