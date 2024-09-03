class DropTableReview < ActiveRecord::Migration[7.1]
  def up
    drop_table :reviews, if_exists: true
  end

  def down
    create_table :reviews do |t|
      t.integer :rating
      t.text :description
      t.references :school, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
