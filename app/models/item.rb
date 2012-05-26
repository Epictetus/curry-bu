class Item < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  belongs_to :shop

  has_many :item_comments

  validates :title, presence: true
  validates :image, presence: true
  validates :ate_at, presence: true
  validates :price, numericality: { only_integer: true, allow_nil: true }
  validates :user_id, presence: true
  validates :shop_id, presence: true

  scope :new_uploads, order("id DESC")
  scope :exclude, lambda { |item| where("id != ?", item) }

  mount_uploader :image, ItemUploader

  # FIXME
  # acts_as_paranoid で論理削除を行なっても CarrierWave で
  # 実ファイルが削除されてしまう件の対応
  # 本当は CarrierWave の remove_column! メソッドを上書きするべきだが
  # どうやればいいか分からないので暫定対応
  def destroy
    Item.record_timestamps = false
    update_attribute(:deleted_at, Time.now)
    Item.record_timestamps = true
  end

end
