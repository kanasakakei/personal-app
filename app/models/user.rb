class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = ""
      user.password = SecureRandom.urlsafe_base64
    end
  end

  has_many :messages
  has_many :posts
  has_many :comments

  mount_uploader :image, ImageUploader
end
