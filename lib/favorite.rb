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
    gets.chomp
  end

  def self.show_fav_list
    self.get_user_fav.map do |fav|
      puts " - " + fav.movie.title
    end
    puts " "
  end

  def self.get_user_fav
    self.all.select do |fav|
      fav.user_id == User.finding_user.id
    end
  end

  def self.choice_of_movie
      puts "Please enter a Movie Title to be added to your Favorites:"
      puts "                        or"
      puts "Press b to go back"
      input = self.prompt()
      movie = Movie.find_by title: input
    if movie != nil && input == movie.title
      user_id = User.finding_user.id
      self.find_or_create_by(movie_id: movie.id, user_id: user_id)
      puts " "
      puts "#{movie.title} has been successfully added to your favorites list."
      puts " "
    elsif input == "b"
      return
    else
      puts "Invalid Command"
    end
  end

  def self.delete_a_mov
      puts "Please enter the Movie title to Delete"
      puts "        or"
      puts "Type b to go Back"
      input = self.prompt()
      movie = Movie.find_by title: input
      movie_id = movie.id
    if movie != nil && input == movie.title
      user_id = User.finding_user.id
      del_mov = self.find_by(movie_id: movie_id)
      del_mov.destroy
      puts "#{movie.title} has been successfully deleted from your list. "
    elsif input == "b"
      return
    else
      return
    end
  end

  def self.delete_command()
    puts "Do you really want to delete all movies from your list?"
    puts "Y: yes    /   N: no"
    gets.chomp.capitalize
  end

  def self.delete_all
      input = delete_command()
    if input == "Y"
      self.all.each do |info|
        if info.user_id == User.finding_user.id
        info.destroy
      end
     end
    elsif input == "N"
      return
    end
  end

end
