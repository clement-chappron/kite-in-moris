class RenameDescrptionToShops < ActiveRecord::Migration[7.1]
  def change
    rename_column :shops, :descrption, :description
  end
end
