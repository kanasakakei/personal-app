class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments

  validates :title, presence: true
  validates :content, presence: true
end
