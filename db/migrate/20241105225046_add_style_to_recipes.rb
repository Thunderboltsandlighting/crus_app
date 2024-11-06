class AddStyleToRecipes < ActiveRecord::Migration[7.2]
  def change
    add_column :recipes, :style, :string
  end
end