class AdjustPrecisionForRecipeAttributes < ActiveRecord::Migration[7.2]
  def change
    change_column :recipes, :abv, :decimal, precision: 4, scale: 1
    change_column :recipes, :ibu, :decimal, precision: 5, scale: 1
    change_column :recipes, :srm, :decimal, precision: 4, scale: 1
  end
end