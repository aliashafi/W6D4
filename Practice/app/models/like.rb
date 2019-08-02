
class Like < ApplicationRecord
  validate :valid
  belongs_to :likeable, polymorphic: true

  belongs_to :user
 
  def valid
    # debugger 
    if !(self.likeable_type == Comment || self.likeable_type == Artwork)
      self.errors[:likeable_id]
      self.errors[:likeable_id] << 'invalid type input'
    elsif self.likeable_type == Comment && !Comment.exists?(id: self.likeable_id)
      errors[:likeable_id].push('comment does not exist')
    elsif self.likeable_type == Artwork && !Artwork.exists?(id: self.likeable_id)
      errors[:likeable_id].push('artwork does not exist')
    end


  end
end
