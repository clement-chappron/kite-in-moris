class School < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :review_schools, dependent: :destroy

  validates :name, :address, :description, :rental, :levels, :fee, :opening_hours, :location, presence: true

  validates :phone, presence: true, format: { with: /\A\+?(\d[\d\- ]{7,}\d)\z/, message: 'doit être un numéro de téléphone valide' }
  validates :website, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp, message: 'doit être une URL valide' }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'doit être une adresse email valide' }

  # has_many :opening_hours, dependent: :destroy

  # Ajout du type
  # validates :category, presence: true, inclusion: { in: %w[school shop] }

  # Geocoding
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
end
