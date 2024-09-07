class AddSlugToSpots < ActiveRecord::Migration[7.1]
  def change
    add_column :spots, :slug, :string
    add_index :spots, :slug, unique: true
  end
end
