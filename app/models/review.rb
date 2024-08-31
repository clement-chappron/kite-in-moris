class Review < ApplicationRecord
  belongs_to :shop, optional: true
  belongs_to :school, optional: true
  belongs_to :user

  validates :rating, presence: true, numericality: { only_integer: true, within: 1..5 }
  validate :school_or_shop_must_be_present
  validates :user, presence: true

  private

  def school_or_shop_must_be_present
    if school.blank? && shop.blank?
      errors.add(:base, "Either a school_id or a shop_id is mandatory!")
    end
  end
end
