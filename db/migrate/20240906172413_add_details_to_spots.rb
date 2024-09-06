class AddDetailsToSpots < ActiveRecord::Migration[7.1]
  def change
    add_column :spots, :wind_conditions, :text
    add_column :spots, :safety, :text
    add_column :spots, :amenities, :text
    add_column :spots, :accessibility, :text
    add_column :spots, :points_of_interest, :text
    add_column :spots, :local_culture, :text
    add_column :spots, :water_temperature, :text
    add_column :spots, :best_time_to_visit, :text
  end
end
