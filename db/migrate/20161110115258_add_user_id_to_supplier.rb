class AddUserIdToSupplier < ActiveRecord::Migration[5.0]
  def change
    add_column :suppliers, :user_id, :integer, :null => false, :default => 0
  end
end
