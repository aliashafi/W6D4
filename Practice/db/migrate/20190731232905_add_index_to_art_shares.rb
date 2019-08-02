class AddIndexToArtShares < ActiveRecord::Migration[5.2]
  def change
    
    add_index :art_shares, :artist_id
    add_index :art_shares, :viewer_id
  end
end
