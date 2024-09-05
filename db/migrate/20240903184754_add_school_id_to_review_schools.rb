class AddSchoolIdToReviewSchools < ActiveRecord::Migration[7.1]
  def change
    rename_column :review_schools, :schools_id, :school_id
    rename_column :review_schools, :users_id, :user_id
    rename_column :review_shops, :shops_id, :shop_id
    rename_column :review_shops, :users_id, :user_id
    rename_column :review_spots, :spots_id, :spot_id
    rename_column :review_spots, :users_id, :user_id
    rename_column :comment_blogs, :blog_pages_id, :blog_page_id
    rename_column :spots, :locations_id, :location_id

  end
end
