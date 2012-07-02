class Shop < ActiveRecord::Base
  acts_as_paranoid
  acts_as_taggable

  belongs_to :create_user, class_name: "User", foreign_key: "create_user_id"
  belongs_to :update_user, class_name: "User", foreign_key: "update_user_id"

  has_many :items

  validates :name,
    presence: true,
    uniqueness: { scope: :deleted_at }

  validates :url,
    format: URI::regexp(%w(http https)),
    if: Proc.new { |a| a.url.present? }

  validates :create_user_id, presence: true
  validates :update_user_id, presence: true

  attr_accessible :name, :url, :address, :tag_list

  #
  # タグを追加する
  #
  def add_tag(name)
    tags = self.tags.map { |tag| tag.name }
    tags << name
    comma_tags = tags.join(',')
    self.update_attributes!(tag_list: comma_tags)
  end

  #
  # タグを削除する
  #
  def remove_tag(name)
    new_tags = []
    self.tags.each do |tag|
      new_tags << tag.name unless tag.name == name
    end
    comma_tags = new_tags.join(',')
    self.update_attributes(tag_list: comma_tags)
  end
end
