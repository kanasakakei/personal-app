class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  validates :title, presence: true
  validates :content, presence: true

  mount_uploader :image, ImageUploader
end
