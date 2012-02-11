class Image < ActiveRecord::Base
  belongs_to :activity
  mount_uploader :image, ImageUploader
end
