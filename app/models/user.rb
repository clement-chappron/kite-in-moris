class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :schools
  has_many :shops
  has_many :blog_pages

  has_many :review_shops
  has_many :review_schools
  has_many :review_spots

  has_one_attached :profile_picture

  validates :first_name, :last_name, :email, presence: true
  # validates :profile_picture, content_type: ['image/png', 'image/jpg', 'image/jpeg', 'image/webp'], size: { less_than: 5.megabytes }
end
