puts "Adding a Whole bunch of paintings"

artist_1= Artist.create(artist: "Romare Bearden")
museum_1= Museum.create(museum: "SF De Young")

p1= Painting.create(title: "Jamming at the Savoy", image: "http://www.nelson-atkins.org/art/exhibitions/bearden/img/Jamming-at-the-SavoyBig.jpg", artist_id: artist_1.id, museum_id: museum_1.id) 

artist_2= Artist.create(artist: "Salvador Dali")
museum_2= Museum.create(museum: "NYC Museum of Modern Art")
p2= Painting.create(title: "The Temptation of St. Anthony", image: "http://www.imafuckingdj.com/wp-content/uploads/2011/01/dali.jpg", artist_id: artist_2.id, museum_id: museum_2.id)

