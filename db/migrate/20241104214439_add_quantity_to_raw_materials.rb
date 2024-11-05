class AddQuantityToRawMaterials < ActiveRecord::Migration[7.2]
  def change
    add_column :raw_materials, :quantity, :integer
  end
end
