# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#see josh if your seed file is not happy, but it should work.
Movie.destroy_all
MovieShelf.destroy_all
User.destroy_all
Shelf.destroy_all


# search_results = MovieDatabase.search("avengers")
avengers = MovieDatabase.get_movie("tt0848228")
avengers_infinity = MovieDatabase.get_movie("tt4154756")
avengers_endgame = MovieDatabase.get_movie("tt4154796")
avengers_ultron = MovieDatabase.get_movie("tt2395427")
avengers_ult_1 = MovieDatabase.get_movie("tt0491703")
avengers_ult_2 = MovieDatabase.get_movie("tt0803093")

# pp search_results
# pp avengers
# pp avengers_endgame

movies = [avengers, avengers_infinity, avengers_endgame, avengers_ultron, avengers_ult_1, avengers_ult_2]

movies.each do |movie|
    new_movie = Movie.new(title: movie["Title"], year: movie["Year"], runtime: movie["Runtime"], genre: movie["Genre"], poster: movie["Poster"], imdb_id: movie["imdbID"])
    new_movie.save
end

user1 = User.create(username:"Justin", password_digest: "downwiththeclown")
user2 = User.create(username:"Josh", password_digest: "lindyhopping")

shelf1 = Shelf.create(user_id: user1.id)
shelf2 = Shelf.create(user_id: user2.id)

movie_shelf1 = MovieShelf.create(shelf_id:shelf1.id, movie_id: Movie.all[rand(3)].id)
movie_shelf2 = MovieShelf.create(shelf_id:shelf1.id, movie_id: Movie.all[rand(3)].id)
movie_shelf3 = MovieShelf.create(shelf_id:shelf1.id, movie_id: Movie.all[rand(3)].id)

movie_shelf4 = MovieShelf.create(shelf_id:shelf2.id, movie_id: Movie.all[rand(6)].id)
movie_shelf5 = MovieShelf.create(shelf_id:shelf2.id, movie_id: Movie.all[rand(6)].id)
movie_shelf6 = MovieShelf.create(shelf_id:shelf2.id, movie_id: Movie.all[rand(6)].id)
puts "done!"


# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)