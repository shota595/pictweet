class Post < ApplicationRecord
  belongs_to :user
  attachment :post_image
  validates :post_image, presence: true
  has_many :favorites, dependent: :destroy
  # has_many :favorited_users, through: :favorites, source: :user
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
