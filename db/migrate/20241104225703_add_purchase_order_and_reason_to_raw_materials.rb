class AddPurchaseOrderAndReasonToRawMaterials < ActiveRecord::Migration[7.2]
  def change
    add_column :raw_materials, :purchase_order, :string
    add_column :raw_materials, :reason, :string
  end
end
