class Movie < ActiveRecord::Base
  has_many :movie_reviews
  has_many :users, through: :movie_reviews

  def movie_info
    <<~info
      Title: #{self.title}
      Rating: #{self.rating}
      Genre: #{self.genre}
      Actors: #{self.actors}
      Directors: #{self.directors}
      Released: #{self.released}
      Awards: #{self.awards}
      Country: #{self.country}
      Languages: #{self.languages}
    info
  end
  
  def self.print_most_popular
    # pop_movies_list = Movie.all.order(movie_reviews: :desc)
    pop_movies_list = Movie.left_joins(:movie_reviews).group(:id).order('COUNT(movie_reviews.id) DESC')
    pop_movies_list.each do |movie|
      puts movie.title 
      puts movie.movie_reviews.count
    end
  end
end