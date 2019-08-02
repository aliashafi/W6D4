class Comment < ApplicationRecord
  validates :body, :artwork_id, :user_id, presence: true

  belongs_to :artwork, 
  foreign_key: :artwork_id, 
  class_name: :Artwork,
  dependent: :destroy

  belongs_to :user, 
  foreign_key: :user_id, 
  class_name: :User, 
  dependent: :destroy
  
  has_many :likes, as: :likeable
end
