class Item < ActiveRecord::Base
  paginates_per 20

  acts_as_paranoid

  belongs_to :user
  belongs_to :shop

  has_many :item_comments
  has_many :likes, as: :likeable

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

  #
  # 投稿に紐付くユーザーのいいね！情報を取得
  #
  def like_by_user(user)
    self.likes.where(user_id: user.id).first
  end

  #
  # いいね！切り替え
  #
  def toggle_like(user)
    return nil if self.nil?

    like = self.like_by_user(user)

    response = {}
    if like.present?
      like.destroy
      response[:status] = :destroy
    else
      like = self.likes.build
      like.user_id = user.id
      like.save
      response[:status] = :create
    end

    response[:count] = self.likes.count

    response
  end

end
