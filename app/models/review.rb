class Review < ApplicationRecord
  belongs_to :school
  belongs_to :shop
  belongs_to :user

  validates :rating, presence: true, numericality: { only_integer: true, within: 1..5 }
  validates :school_or_shop_must_be_present
  validates :user_id, presence: true

  private

  def school_or_shop_must_be_present
    if school_id.blank? && shop_id.blank?
      errors.add(:base, "Either a school_id or a shop_id is mandatory!")
    end
  end
end
