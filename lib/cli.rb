class CommandLineInterface
  def sign_in_user
    User.sign_in
  end

  def help
    puts " "
    puts "               Hi, #{User.show_user_name}!"
    puts " "
    puts " _(*´・ω・`)ノ________________________________"
    puts "|    These are the commands provided:         |"
    puts "|  1. Help : displays this help message       |"
    puts "|  2. Genres : show genres                    |"
    puts "|  3. My Favorites : see your saved favorites |"
    puts "|  4. Change your username                    |"
    puts "|  5. Exit : exits program                    |"
    puts "|___________________________________ˎ₍•ʚ•₎ˏ___|"
  end

  def list_of_genres
    puts " _______(๑•᎑< ๑)♡______________________________"
    puts "| Type the number of genre you are interested. |"
    puts "|                1. Action                     |"
    puts "|                2. Comedy                     |"
    puts "|                3. Science Fiction            |"
    puts "|                4. Romance                    |"
    puts "|                5. Horror                     |"
    puts "|                6. Mystery                    |"
    puts "|                7. All                        |"
    puts "|                b. Back to help               |"
    puts "|___________________________________ฅ^._.^ฅ____|"
  end

  def prompt()
    puts " "
    puts "Please enter a command:"
    puts " "
    gets.chomp.downcase
  end

  def run
    help
    input = prompt()
      if input == "1"
        self.run
      elsif input == "2"
        genres
        self.run
      elsif input == "3"
        favorite
        self.run
      elsif input == "4"
        changeing_name
        self.run
      elsif input == "5"
        exit
      else
        puts "Invalid command"
        self.run
      end
  end


  def genres
      self.list_of_genres
      input = prompt()
    if input == "1"
      Movie.action
      Favorite.choice_of_movie
      self.genres
    elsif input == "2"
      Movie.comedy
      Favorite.choice_of_movie
      self.genres
    elsif input == "3"
      Movie.science_fiction
      Favorite.choice_of_movie
      self.genres
    elsif input == "4"
      Movie.romance
      Favorite.choice_of_movie
      self.genres
    elsif input == "5"
      Movie.horror
      Favorite.choice_of_movie
      self.genres
    elsif input == "6"
      Movie.mystery
      Favorite.choice_of_movie
      self.genres
    elsif input == "7"
      Movie.all_movies
      Favorite.choice_of_movie
      self.genres
    elsif input == "b"
      #Go back to Run
    else
      puts "Invalid command"
      self.genres
    end
  end

  def favorite
      Favorite.fav_help
      input = prompt()
    if input == "1"
      Favorite.show_fav_list
      self.favorite
    elsif input == "2"
      Favorite.show_fav_list
      Favorite.delete_a_mov
      self.favorite
    elsif input == "3"
      Favorite.show_fav_list
      Favorite.delete_all
      self.favorite
    elsif input == "b"
      #Let you out from this favorite list because this method is going to be completed
    else
      puts "Invalid Command"
      self.favorite
    end
  end

  def exit
    puts "Successfully Logged Out"
    return
  end
end
