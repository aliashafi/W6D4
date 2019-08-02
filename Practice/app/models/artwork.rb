class Artwork < ApplicationRecord
  validates :artist_id, :title, :image_url, presence: true

  belongs_to :artist, 
  foreign_key: :artist_id, 
  class_name: :User,
  dependent: :destroy

  has_many :comments, 
  foreign_key: :artwork_id, 
  class_name: :Comment

  has_many :likes, as: :likeable

  has_many :favorites, 
  foreign_key: :favorite, 
  class_name: :ArtShare

end