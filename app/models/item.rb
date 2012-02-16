class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop
  mount_uploader :image, ItemUploader
end
