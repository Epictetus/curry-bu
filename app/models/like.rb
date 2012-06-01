class Like < ActiveRecord::Base
  belongs_to :likeable, polymorphic: true
  belongs_to :user

  validates :likeable_id,
    presence: true,
    uniqueness: { scope: [:likeable_type, :user_id] }
end
