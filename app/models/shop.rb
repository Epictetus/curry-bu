class Shop < ActiveRecord::Base
  validates :name,
    presence: true

  #belongs_to :user, class_name: "CreateUser", foreign_key: "create_user_id"
  #belongs_to :user, class_name: "UpdateUser", foreign_key: "update_user_id"
end
