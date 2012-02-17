# coding: utf-8
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable
  attr_accessible :username, :password, :password_confirmation, :remember_me

  validates :username,
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
