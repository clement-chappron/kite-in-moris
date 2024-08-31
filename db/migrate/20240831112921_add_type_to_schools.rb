class AddTypeToSchools < ActiveRecord::Migration[7.1]
  def change
    add_column :schools, :type, :string
  end
end
