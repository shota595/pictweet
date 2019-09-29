class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :following_relationships, foreign_key: "following_id",
                                              class_name: "Relationship",
                                              dependent: :destroy
  has_many :follower_relationships, foreign_key: "follower_id",
                                              class_name: "Relationship",
                                              dependent: :destroy
  has_many :followings, through: :following_relationships, source: :follower
  has_many :followers, through: :follower_relationships, source: :following
  # has_many :favorited_posts, through: :favorites, source: :post
  attachment :profile_image

  def followed_by?(user)
    follower_relationships.find_by(following_id: user.id)
  end
end
