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
      self.genres
    elsif input == "3"
      self.favorite
    elsif input == "4"
      self.changing_name
    elsif input == "5"
      return self.exit
    else
      puts "Invalid command"
    end
  end

  def changing_name
    User.change_name
    self.run
  end

  def genres
    self.list_of_genres
    input = prompt()
    if input == "1"
      Movie.action
    elsif input == "2"
      Movie.comedy
    elsif input == "3"
      Movie.science_fiction
    elsif input == "4"
      Movie.romance
    elsif input == "5"
      Movie.horror
    elsif input == "6"
      Movie.mystery
    elsif input == "7"
      Movie.all_movies
    elsif input == "b"
      self.run
      return
    else
      puts "Invalid command"
    end
    Favorite.choice_of_movie
    self.run
  end

  def favorite
      Favorite.fav_help
      input = prompt()
    if input == "1"
      Favorite.show_fav_list
    elsif input == "2"
      Favorite.show_fav_list
      Favorite.delete_a_mov
    elsif input == "3"
      Favorite.show_fav_list
      Favorite.delete_all
    elsif input == "b"
      self.run
      return
    else
      puts "Invalid Command"
      self.favorite
    end
    self.favorite
  end

  def exit
    puts "Successfully Logged Out"
    return
  end
end
