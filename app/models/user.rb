class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable
  attr_accessible :name, :password, :password_confirmation, :remember_me

  validates :name,
    presence: true,
    uniqueness: true

  validates :password,
    presence: true,
    confirmation: true

  validates :password_confirmation,
    presence: true
end
