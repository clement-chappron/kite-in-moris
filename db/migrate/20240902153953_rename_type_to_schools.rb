class RenameTypeToSchools < ActiveRecord::Migration[7.1]
  def change
    rename_column :schools, :type, :category
  end
end
