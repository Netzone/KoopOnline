class AddCityToUserAndSupplier < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :city, :string
    add_column :suppliers, :city, :string
  end
end
