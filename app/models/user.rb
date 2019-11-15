class User < ApplicationRecord
  before_validation { email.downcase! }
  has_secure_password
  mount_uploader :image, ImageUploader
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post

  validates :full_name, presence: true, length: { maximum: 30 }
  validates :user_name, presence: true, length: { maximum: 30 }
  validates :email, presence: true,
                    uniqueness: true,
                    length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
                              allow_blank: true }
  validates :password, length: { minimum: 8, allow_blank: true }
end
