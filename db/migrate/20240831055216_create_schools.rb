class CreateSchools < ActiveRecord::Migration[7.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :website
      t.string :email
      t.text :description
      t.text :rental
      t.text :levels
      t.string :fee
      t.string :facebook
      t.string :instagram
      t.references :user, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
