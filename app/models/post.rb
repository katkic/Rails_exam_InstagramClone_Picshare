class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user

  validates :image, presence: true
  validates :caption, presence: true
end
