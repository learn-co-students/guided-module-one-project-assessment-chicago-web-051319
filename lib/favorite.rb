require 'pry'

class Favorite < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  def self.fav_help
    puts "            ########################"
    puts "             Favorite List of Movies"
    puts "            ########################"
    puts " "
    puts " ______________________________________________"
    puts "|         Type a number to proceed             |"
    puts "|     1. View your favorites                   |"
    puts "|     2. Remove a movie from your favorites    |"
    puts "|     3. Delete all your favorites list        |"
    puts "|     b. Back                                  |"
    puts "|___________________________________ฅ^._.^ฅ____|"
    puts " "
  end

  def self.prompt()
    puts " "
    gets.chomp.downcase
  end

  def self.show_fav_list
    self.get_user_fav.map do |fav|
      puts "     - " + fav.movie.title
      puts " "
    end
    puts " "
  end

  def self.get_user_fav
    self.all.select do |fav|
      fav.user_id == User.finding_user.id
    end
  end


  def self.choice_of_movie
      puts "- Please enter a Movie Title to be added to your Favorites:"
      puts "- Press b to go back"
      puts " "
      input = self.prompt()
      # movie = Movie.find_by title: input
      movie = Movie.where("LOWER(title) = ?", input)[0]
    if input == "b"
      return
    elsif movie != nil && input == movie.title.downcase
      user_id = User.finding_user.id
      self.find_or_create_by(movie_id: movie.id, user_id: user_id)
      puts " "
      puts "#{movie.title} has been successfully added to your favorites list."
      puts " "
    else
      puts "- Invalid Command"
    end
  end

  def self.delete_a_mov
      puts "- Please enter the Movie title to Delete:"
      puts "- Type b to go Back"
      puts " "
      input = self.prompt()
      # movie = Movie.find_by title: input
      movie = Movie.where("LOWER(title) = ?", input)[0]
    if input == "b" || input == "back"
      return
    elsif movie != nil && input == movie.title.downcase
      movie_id = movie.id
      user_id = User.finding_user.id
      del_mov = Favorite.find_by(user_id: user_id, movie_id: movie_id)
      del_mov.destroy
      puts "#{movie.title} has been successfully deleted from your list. "
    else
      return
    end
  end

  def self.delete_command()
    puts "- Do you really want to delete all movies from your list?"
    puts "Y: yes    /   N: no"
    gets.chomp.upcase
  end

  def self.delete_all
      input = delete_command()
    if input == "Y" || input == "YES"
      self.all.each do |info|
        if info.user_id == User.finding_user.id
        info.destroy
      end
     end
   elsif input == "N" || input == "NO"
      return
    end
  end

end
