class ChangeColumnIsManagerToUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :is_manager, :boolean, default: false
  end
end
