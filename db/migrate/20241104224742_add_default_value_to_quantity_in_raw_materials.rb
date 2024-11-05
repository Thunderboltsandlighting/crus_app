class AddDefaultValueToQuantityInRawMaterials < ActiveRecord::Migration[6.1]
  def change
    change_column_default :raw_materials, :quantity, 0
  end
end