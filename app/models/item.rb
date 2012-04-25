class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop

  validates :title, presence: true
  validates :image, presence: true
  validates :ate_at, presence: true
  validates :shop, presence: true
  validates :price, numericality: { only_integer: true, allow_nil: true }

  scope :ate_new, order("ate_at DESC")

  mount_uploader :image, ItemUploader
end
