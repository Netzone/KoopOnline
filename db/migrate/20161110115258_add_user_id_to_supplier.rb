class AddUserIdToSupplier < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_id, :integer, :null => false, :default => 0
  end
end
