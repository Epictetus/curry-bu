# coding: utf-8
class User < ActiveRecord::Base
  acts_as_paranoid

  has_many :items, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :item_comments, dependent: :destroy

  devise :database_authenticatable, :registerable, :rememberable

  validates :login_name,
    presence: true,
    uniqueness: { scope: :deleted_at },
    length: { maximum: 40 }

  validates :login_name,
    format: { with: /^[0-9A-Za-z]+$/ , message: "は半角英数字で入力してください。" },
    if: Proc.new { |a| a.login_name.present? }

  validates :mail,
    presence: true,
    uniqueness: { scope: :deleted_at },
    length: { maximum: 200 }

  validates :mail,
    email: { message: "正しいメールアドレスを入力してください。" },
    if: Proc.new { |a| a.mail.present? }

  validates :password,
    presence: true,
    confirmation: true,
    if: :password_required?

  mount_uploader :image, AvatarUploader

  attr_accessible :mail, :login_name, :image, :password, :password_confirmation, :remember_me

  protected

  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end
end
