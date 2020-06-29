class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  mount_uploader :image, ImageUploader

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = ""
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
  
end
