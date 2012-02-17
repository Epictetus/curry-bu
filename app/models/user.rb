class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable
  attr_accessible :username, :password, :password_confirmation, :remember_me

  validates :username,
    presence: true,
    uniqueness: true

  validates :password,
    presence: true,
    confirmation: true

  validates :password_confirmation,
    presence: true
end
