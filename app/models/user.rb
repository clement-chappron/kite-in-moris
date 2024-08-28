class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :schools
  has_many :shops
  has_many :blog_pages
  has_many :reviews
  has_one_attached :profile_picture

  validates :first_name, :last_name, :email, :address, presence: true
end
