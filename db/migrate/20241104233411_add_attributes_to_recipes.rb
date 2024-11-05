class AddAttributesToRecipes < ActiveRecord::Migration[7.2]
  def change
    add_column :recipes, :abv, :decimal
    add_column :recipes, :ibu, :decimal
    add_column :recipes, :srm, :decimal
  end
end