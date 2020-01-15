class MovieReview < ActiveRecord::Base
belongs_to :user
belongs_to :movie

  def review_info
    <<~info
    #{self.id}:
    A review of #{self.movie.title} by #{self.user.name}
    #{self.body}
    #{self.rating}
    info
  end

  def self.print_all_movies
    self.all.each do |review|
      puts review.review_info
      puts "**************************"
    end
  end

end