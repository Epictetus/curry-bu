class Item < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  belongs_to :shop

  validates :title, presence: true
  validates :image, presence: true
  validates :ate_at, presence: true
  validates :shop, presence: true
  validates :price, numericality: { only_integer: true, allow_nil: true }

  scope :ate_new, order("ate_at DESC")

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
