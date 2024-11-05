class CreateRawMaterials < ActiveRecord::Migration[7.2]
  def change
    create_table :raw_materials do |t|
      t.string :sku
      t.string :product_description
      t.string :category
      t.string :uom
      t.integer :re_order_level
      t.integer :mpq
      t.decimal :cost_per_mpq
      t.decimal :cost_per_uom
      t.string :vendor
      t.string :vendor_contact

      t.timestamps
    end
  end
end
