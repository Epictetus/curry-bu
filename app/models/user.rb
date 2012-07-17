# coding: utf-8
class User < ActiveRecord::Base
  acts_as_paranoid

  extend FriendlyId
  friendly_id :login_name

  devise :database_authenticatable, :registerable, :rememberable

  mount_uploader :image, AvatarUploader

  has_many :items, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :item_comments, dependent: :destroy

  validates :login_name,
    presence: true,
    uniqueness: { scope: :deleted_at },
    length: { maximum: 40 }

  validates :login_name,
    format: { with: /^[0-9A-Za-z_-]+$/ , message: "は半角英数字、アンダーバー、ハイフンを入力してください。" },
    if: Proc.new { |a| a.login_name.present? }

  validates :mail,
    presence: true,
    uniqueness: { scope: :deleted_at },
    length: { maximum: 200 }

  validates :mail,
    email: { message: "が不正です。" },
    if: Proc.new { |a| a.mail.present? }

  validates :password,
    presence: true,
    confirmation: true,
    if: :password_required?

  attr_accessible :mail, :login_name, :image, :password, :password_confirmation, :remember_me

  protected

  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end
end
