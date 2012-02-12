class Image < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user
  mount_uploader :image, ImageUploader
end
