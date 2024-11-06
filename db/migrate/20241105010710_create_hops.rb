class CreateHops < ActiveRecord::Migration[7.2]
  def change
    create_table :hops do |t|
      t.string :name
      t.decimal :amount
      t.string :uom
      t.integer :time
      t.decimal :ibu
      t.string :type
      t.decimal :total_cost
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end