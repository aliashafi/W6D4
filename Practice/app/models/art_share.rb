class ArtShare < ApplicationRecord
  # validate :valid_fav?
  validates :artist_id, :viewer_id, presence: true

  belongs_to :artist,
  foreign_key: :artist_id, 
  class_name: :User,
  dependent: :destroy

  belongs_to :viewer,
  foreign_key: :viewer_id, 
  class_name: :User,
  dependent: :destroy

  has_many :arts, 
  through: :artist, 
  source: :artworks

  belongs_to :artwork,
  foreign_key: :favorite, 
  class_name: :Artwork

  # def valid_fav?
  #   ##if person already has favorited the new fav
  #   if self.favorite != nil
  #     same_fav = ArtShare.where(viewer_id: self.viewer_id, favorite: self.favorite)
      
  #     ##check if i fav??
  #     fav_check = ArtShare.where(viewer_id: self.viewer_id)
  #     if !same_fav.empty? || !(fav_check.all? {|viewer| viewer.viewer_id.nil?})
  #       errors[:favorite] << "already has a favorite!"
  #     end
  #   end
    
  # end

end