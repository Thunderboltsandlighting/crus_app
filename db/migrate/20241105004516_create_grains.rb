class CreateGrains < ActiveRecord::Migration[7.2]
  def change
    create_table :grains do |t|
      t.string :name
      t.decimal :amount
      t.string :uom
      t.decimal :total_cost
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end