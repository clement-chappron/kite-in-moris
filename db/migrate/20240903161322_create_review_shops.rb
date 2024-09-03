class CreateReviewShops < ActiveRecord::Migration[7.1]
  def change
    create_table :review_shops do |t|
      t.integer :rating
      t.text :description
      t.references :shops, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
