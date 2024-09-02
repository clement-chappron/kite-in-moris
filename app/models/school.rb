class School < ApplicationRecord
  belongs_to :user
  belongs_to :location

  # has_many :opening_hours, dependent: :destroy
  has_many :reviews, as: :shop_school, dependent: :destroy

  # Ajout du type
  validates :category, presence: true, inclusion: { in: %w[school shop] }

  # Geocoding
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
end
