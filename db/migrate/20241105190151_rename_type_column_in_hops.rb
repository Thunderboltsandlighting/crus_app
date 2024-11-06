class RenameTypeColumnInHops < ActiveRecord::Migration[7.2]
  def change
    rename_column :hops, :type, :hop_type
  end
end