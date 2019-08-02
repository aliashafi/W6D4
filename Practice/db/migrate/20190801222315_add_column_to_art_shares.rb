class AddColumnToArtShares < ActiveRecord::Migration[5.2]
  def change
    add_column :art_shares, :favorite, :integer

    add_index :art_shares, [:favorite, :viewer_id], unique: true
  end
end
