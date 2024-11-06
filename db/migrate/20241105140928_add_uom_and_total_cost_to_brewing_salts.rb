class AddUomAndTotalCostToBrewingSalts < ActiveRecord::Migration[7.2]
  def change
    add_column :brewing_salts, :uom, :string
    add_column :brewing_salts, :total_cost, :decimal
  end
end