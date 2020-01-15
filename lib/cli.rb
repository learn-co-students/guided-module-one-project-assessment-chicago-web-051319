class CommandLineInterface
  
# still need to seed in dummy reviews and assign to movies

  def get_menu_selection
    puts "Would you like to write a 'new review', 'edit a review', 'delete a review', or 'see the most reviewed movies?'"
    return gets.chomp
  end

  def get_and_print_movie(search_term)
    current_movie = Movie.find_by(title: search_term)
    puts current_movie.movie_info 
    current_movie
  end

  def prompt_for_review
    puts "Would you like to write a review for this movie? (yes/no)"
    gets.chomp
  end

  def make_review(current_user, current_movie)
    puts "Please write your review here:"
    body = gets.chomp
    puts "On a scale of 1-5, how would you rate this movie?"
    rating = gets.chomp
    users_new_review = MovieReview.create(user: current_user, movie: current_movie, 
    body: body, rating: rating)
    users_new_review.review_info
  end

  def update_review(review_to_update)
    puts "Please write your edited review here:"
    edited_body = gets.chomp
    puts "If you would like to change your 1-5 rating, please enter it:"
    edited_rating = gets.chomp
    review_to_update.update(body: edited_body, rating: edited_rating)
    puts review_to_update.review_info
  end

  def run
    puts "Welcome to the Movie Database! Please enter a username."
    username = gets.chomp
    current_user = User.find_or_create_by(name: username)
    puts "Thank you, #{current_user.name}."
    input = nil
    while input != "exit"
      input = get_menu_selection

      if input == "new review"
        puts "Please search for a movie to review."
        movie_search = gets.chomp
        current_movie = get_and_print_movie(movie_search)
        if prompt_for_review == "yes"
          make_review(current_user, current_movie)
        end
        next
      
      elsif input == "edit a review"
        MovieReview.print_all_movies
        puts "Please select a movie to edit."
          edit_search = gets.chomp
          current_review = MovieReview.find(edit_search)
          puts current_review.review_info
          update_review(current_review)
          next

      elsif input == "delete a review"
        MovieReview.print_all_movies
        puts "Please search for the review to delete:"
          deletion_search = gets.chomp
          current_movie = MovieReview.delete(deletion_search)
        next
      
      elsif input === "see the most reviewed movies" || input == "most popular movies"
        Movie.print_most_popular
        next
      end
    end
  end
end