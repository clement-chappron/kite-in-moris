class RenameTypeToShops < ActiveRecord::Migration[7.1]
  def change
    rename_column :shops, :type, :category
  end
end
