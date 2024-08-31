class ChangeSchoolAndShopInReviews < ActiveRecord::Migration[7.1]
  def change
    change_column_null :reviews, :school_id, true
    change_column_null :reviews, :shop_id, true
  end
end
