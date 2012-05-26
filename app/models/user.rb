# coding: utf-8
class User < ActiveRecord::Base
  acts_as_paranoid

  has_many :items

  devise :database_authenticatable, :registerable, :rememberable

  validates :login_name,
    presence: true,
    uniqueness: { scope: :deleted_at },
    length: { maximum: 40 },
    format: { with: /^[0-9A-Za-z]+/ , message: "は半角英数字で入力してください。" }

  validates :password,
    presence: true,
    confirmation: true

  validates :password_confirmation,
    presence: true

  attr_accessible :login_name, :password, :password_confirmation, :remember_me
end
