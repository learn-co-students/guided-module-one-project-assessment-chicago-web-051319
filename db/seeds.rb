# Movie.create("Blade Runner 2049", "http://www.omdbapi.com/?i=tt1856101&apikey=3e8e2f4") 
# Movie.create("The Big Lebowski", "http://www.omdbapi.com/?i=tt0118715&apikey=3e8e2f4")
# Movie.create("Isle of Dogs", "http://www.omdbapi.com/?i=tt5104604&apikey=3e8e2f4")
# Movie.create("Her", "http://www.omdbapi.com/?i=tt1798709&apikey=3e8e2f4")
# Movie.create("Lost in Translation", "http://www.omdbapi.com/?i=tt0335266&apikey=3e8e2f4")
# Movie.create("Ex Machina", "http://www.omdbapi.com/?i=tt0470752&apikey=3e8e2f4")
# Movie.create("There will be Blood", "http://www.omdbapi.com/?i=tt0469494&apikey=3e8e2f4")
# Movie.create("Interstellar", "http://www.omdbapi.com/?i=tt0816692&apikey=3e8e2f4")
# Movie.create("No Country for Old Men", "http://www.omdbapi.com/?i=tt0477348&apikey=3e8e2f4")
# Movie.create("The Lord of the Rings: The Fellowship of the Ring", "http://www.omdbapi.com/?i=tt0120737&apikey=3e8e2f4")

# Movie table will need these columns:
# id      --id needs to be added to the Movie table
# Title   :string
# Rating  :integer
# Genre    :string
# Actors  :string
# Directors :string
# Released :string
# Awards :string
# Budget :string -- Remove 
# Revenue (listed as "BoxOffice" in the source database) :string? :int? -- Remove
# Country :string
# Languages :string

urls_to_grab = ["http://www.omdbapi.com/?i=tt1856101&apikey=3e8e2f4", 
"http://www.omdbapi.com/?i=tt0118715&apikey=3e8e2f4", 
"http://www.omdbapi.com/?i=tt5104604&apikey=3e8e2f4", 
"http://www.omdbapi.com/?i=tt1798709&apikey=3e8e2f4", 
"http://www.omdbapi.com/?i=tt0335266&apikey=3e8e2f4", 
"http://www.omdbapi.com/?i=tt0470752&apikey=3e8e2f4",
"http://www.omdbapi.com/?i=tt0469494&apikey=3e8e2f4",
"http://www.omdbapi.com/?i=tt0816692&apikey=3e8e2f4",
"http://www.omdbapi.com/?i=tt0477348&apikey=3e8e2f4",
"http://www.omdbapi.com/?i=tt0120737&apikey=3e8e2f4"]

urls_to_grab.collect do |url|
  movie_response = RestClient.get(url)
  # p movie_hash
  movie_hash = JSON.parse(movie_response.body)
  Movie.create({imdb_id: movie_hash["imdbID"], 
  title: movie_hash["Title"], 
  rating: movie_hash["Metascore"], 
  genre: movie_hash["Genre"], 
  actors: movie_hash["Actors"], 
  directors: movie_hash["Director"], 
  released: movie_hash["Released"], 
  awards: movie_hash["Awards"], 
  country: movie_hash["Country"], 
  languages: movie_hash["Languages"]})
end

# Users will need:
# id
# username
# reviews 

# Movie_Reviews will need:
# id
# user_id
# movie_id
# review_text
# rating