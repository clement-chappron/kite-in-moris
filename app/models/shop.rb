class Shop < ApplicationRecord
  belongs_to :location
  belongs_to :user

  has_many :reviews, dependent: :destroy
end
