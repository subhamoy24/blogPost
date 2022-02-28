class Post < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  mount_uploader :thumb_nail, ThumbNailUploader

  belongs_to :user
  belongs_to :category
end
