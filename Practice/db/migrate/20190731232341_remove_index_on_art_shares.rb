class RemoveIndexOnArtShares < ActiveRecord::Migration[5.2]
  def change
    remove_index :art_shares, :artist_id
    remove_index :art_shares, :viewer_id
  end
end
