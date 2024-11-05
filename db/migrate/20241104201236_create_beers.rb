class CreateBeers < ActiveRecord::Migration[7.2]
  def change
    create_table :beers do |t|
      t.string :recipe

      t.timestamps
    end
  end
end
