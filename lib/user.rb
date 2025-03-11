class User < ActiveRecord::Base
  has_many :movie_reviews
  has_many :movies, through: :movie_reviews
end
