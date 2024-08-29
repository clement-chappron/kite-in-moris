class Location < ApplicationRecord
  has_many :schools
  has_many :shops

  validates :name, :description, presence: true
  validates :name, uniqueness: true

  has_many_attached :images
end
