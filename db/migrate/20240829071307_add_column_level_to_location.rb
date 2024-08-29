class AddColumnLevelToLocation < ActiveRecord::Migration[7.1]
  def change
    add_column :locations, :level, :string
  end
end
