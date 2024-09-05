class RemoveLevelToLocation < ActiveRecord::Migration[7.1]
  def change
    remove_column :locations, :level
    add_column :spots, :level, :string
  end
end
