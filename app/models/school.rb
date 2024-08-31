class School < ApplicationRecord
  belongs_to :user
  belongs_to :location

  has_many :reviews, foreign_key: :school_id, dependent: :destroy
end
