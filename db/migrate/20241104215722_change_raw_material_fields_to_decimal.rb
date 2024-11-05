class ChangeRawMaterialFieldsToDecimal < ActiveRecord::Migration[6.1]
  def change
    change_column :raw_materials, :mpq, :decimal, precision: 10, scale: 2
    change_column :raw_materials, :cost_per_mpq, :decimal, precision: 10, scale: 2
    change_column :raw_materials, :cost_per_uom, :decimal, precision: 10, scale: 2
  end
end