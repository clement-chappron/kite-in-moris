class DropTableReview < ActiveRecord::Migration[7.1]
  def up
    drop_table :reviews
  end
end
