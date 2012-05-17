# coding: utf-8
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable
  attr_accessible :login_name, :password, :password_confirmation, :remember_me

  validates :login_name,
    presence: true,
    uniqueness: true,
    length: { maximum: 40 },
    format: { with: /^[0-9A-Za-z]+/ , message: "は半角英数字で入力してください。" }

  validates :password,
    presence: true,
    confirmation: true

  validates :password_confirmation,
    presence: true
end
