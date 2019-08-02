class CreatArtShares < ActiveRecord::Migration[5.2]
  def change
    create_table :art_shares do |t|
      t.integer :artist_id, null: false
      t.integer :viewer_id, null: false
      t.timestamps
    end

    add_index :art_shares, :artist_id, unique: true
    add_index :art_shares, :viewer_id, unique: true
    add_index :art_shares, [:artist_id, :viewer_id], unique: true

    
  end
end
