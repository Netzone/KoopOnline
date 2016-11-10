class CreateTagsSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :tags_suppliers do |t|
      t.integer :tag_id
      t.integer :supplier_id

      t.timestamps
    end
  end
end
