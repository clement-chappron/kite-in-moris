class AddTypeToShops < ActiveRecord::Migration[7.1]
  def change
    add_column :shops, :type, :string
  end
end
