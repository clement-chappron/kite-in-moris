class RenameFacilityTypeColumnInSchools < ActiveRecord::Migration[7.1]
  def change
    rename_column :schools, :facility_type, :type
  end
end
