class Activity < ActiveRecord::Base
  belongs_to :shop
  belongs_to :user
  has_many :images
end
