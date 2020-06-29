class Message < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :group, optional: true
  validates :content, presence: true

  mount_uploader :image, ImageUploader
  
end
