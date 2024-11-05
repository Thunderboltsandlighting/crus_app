class AddReceivedDateAndDeductionDateToRawMaterials < ActiveRecord::Migration[7.2]
  def change
    add_column :raw_materials, :received_date, :date
    add_column :raw_materials, :deduction_date, :date
  end
end
