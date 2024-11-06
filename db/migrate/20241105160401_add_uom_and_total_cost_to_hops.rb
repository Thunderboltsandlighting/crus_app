class AddUomAndTotalCostToHops < ActiveRecord::Migration[7.2]
  def change
    add_column :hops, :uom, :string
    add_column :hops, :total_cost, :decimal
  end
end
