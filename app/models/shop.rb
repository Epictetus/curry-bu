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
    format: URI::regexp(%w(http https))

  validates :create_user_id, presence: true
  validates :update_user_id, presence: true

  #
  # タグを追加する
  #
  def add_tag(name)
    tags = self.tags.map { |tag| tag.name }
    tags << name
    comma_tags = tags.join(',')
    self.tag_list = comma_tags
    self.save
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
    self.tag_list = comma_tags
    self.save
  end
end
