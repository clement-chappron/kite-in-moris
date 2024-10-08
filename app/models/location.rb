class Location < ApplicationRecord
  has_many :schools
  has_many :shops
  has_many :spots

  validates :name, :description, presence: true
  validates :name, uniqueness: true

  has_many_attached :images
  has_one_attached :main_image
end
