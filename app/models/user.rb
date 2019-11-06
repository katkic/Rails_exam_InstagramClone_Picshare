class User < ApplicationRecord
  validates :full_name, presence: true, length: { maximum: 30}
  validates :user_name, presence: true, length: { maximum: 30}
  validates :email, presence: true,
            length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: true,
            allow_blank: true
  validates :password, length: { minimum: 8, allow_blank: true }
end
