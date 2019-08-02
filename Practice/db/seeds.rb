# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do 

User.destroy_all

u1 = User.create!(user_name: "aliashafi")
u2 = User.create!(user_name: "bobis124")
u3 = User.create!(user_name: "digbangbat")
u4 = User.create!(user_name: "supdood1234")
u5 = User.create!(user_name: "iamgreen345")

Artwork.destroy_all

a1 = Artwork.create!(title: "flowers", image_url: "flowers.com/sup", artist_id: u1.id)
a2 = Artwork.create!(title: "house", image_url: "house.com/art", artist_id: u1.id)
a3 = Artwork.create!(title: "sun", image_url: "stARS.com/sup", artist_id: u2.id)
a4 = Artwork.create!(title: "RED", image_url: "colors.com/sup", artist_id: u3.id)
a5 = Artwork.create!(title: "flowers2", image_url: "flowers2.com/sup", artist_id: u3.id)


ArtShare.destroy_all
as1 = ArtShare.create!(artist_id: u1.id,viewer_id: u5.id)
as2 = ArtShare.create!(artist_id: u1.id,viewer_id: u2.id)
as3 = ArtShare.create!(artist_id: u2.id,viewer_id: u4.id)
as4 = ArtShare.create!(artist_id: u3.id,viewer_id: u5.id)

Comment.destroy_all

c1 = Comment.create!(body: "nice", user_id: u1.id, artwork_id: a2.id)
c2 = Comment.create!(body: "not nice", user_id: u3.id, artwork_id: a2.id)
c3 = Comment.create!(body: "so pretty", user_id: u4.id, artwork_id: a4.id)
end