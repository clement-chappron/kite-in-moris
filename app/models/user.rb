class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :schools, foreign_key: :user_id
  has_many :shops, foreign_key: :user_id
  has_many :blog_pages, foreign_key: :user_id
  has_many :reviews, foreign_key: :user_id
  has_one_attached :profile_picture

  validates :first_name, :last_name, :email, :address, presence: true
  # validates :profile_picture, content_type: ['image/png', 'image/jpg', 'image/jpeg', 'image/webp'], size: { less_than: 5.megabytes }
end
