class AddUomAndTotalCostToGrains < ActiveRecord::Migration[7.2]
  def change
    add_column :grains, :uom, :string
    add_column :grains, :total_cost, :decimal
  end
end
