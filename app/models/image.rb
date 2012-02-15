class Image < ActiveRecord::Base
  belongs_to :shop
  belongs_to :user
  mount_uploader :image, ImageUploader
end
