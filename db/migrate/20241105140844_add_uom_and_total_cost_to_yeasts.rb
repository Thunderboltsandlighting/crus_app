class AddUomAndTotalCostToYeasts < ActiveRecord::Migration[7.2]
  def change
    add_column :yeasts, :uom, :string
    add_column :yeasts, :total_cost, :decimal
  end
end
