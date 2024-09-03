class RenameTypeColumnInSchools < ActiveRecord::Migration[7.1]
  def change
    rename_column :schools, :type, :facility_type
  end
end
r
