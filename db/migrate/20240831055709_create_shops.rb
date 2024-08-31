class CreateShops < ActiveRecord::Migration[7.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :website
      t.text :descrption
      t.string :email
      t.string :facebook
      t.string :instagram
      t.references :location, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
