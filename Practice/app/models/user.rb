class User < ApplicationRecord
  validates :user_name, presence: true, uniqueness: true

  has_many :artworks, 
  foreign_key: :artist_id, 
  class_name: :Artwork

  has_many :artists,
  foreign_key: :artist_id, 
  class_name: :ArtShare

  has_many :viewers,
  foreign_key: :viewer_id, 
  class_name: :ArtShare

  has_many :shared_artworks,
  through: :viewers, 
  source: :arts

  has_many :comments, 
  foreign_key: :user_id, 
  class_name: :Comment

  has_many :likes  


end
