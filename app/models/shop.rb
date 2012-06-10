class Shop < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :create_user, class_name: "User", foreign_key: "create_user_id"
  belongs_to :update_user, class_name: "User", foreign_key: "update_user_id"

  has_many :items

  validates :name,
    presence: true,
    uniqueness: { scope: :deleted_at }

  validates :url,
    format: URI::regexp(%w(http https))

  validates :create_user_id, presence: true
  validates :update_user_id, presence: true
end
