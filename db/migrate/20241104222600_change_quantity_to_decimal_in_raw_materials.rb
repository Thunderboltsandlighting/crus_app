class ChangeQuantityToDecimalInRawMaterials < ActiveRecord::Migration[6.1]
  def change
    change_column :raw_materials, :quantity, :decimal, precision: 10, scale: 2
  end
end