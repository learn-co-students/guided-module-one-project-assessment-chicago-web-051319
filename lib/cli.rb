class CommandLineInterface

  def self.sign_in_user
    User.sign_in
  end

  def self.help
    puts `clear`
    puts " "
    puts "               Hi, #{User.show_user_name}!"
    puts " "
    puts "         _(*´・ω・`)ノ________________________________"
    puts "        |    These are the commands provided:         |"
    puts "        |  1. Help : displays this help message       |"
    puts "        |  2. Genres : show genres                    |"
    puts "        |  3. My Favorites : see your saved favorites |"
    puts "        |  4. Change your username                    |"
    puts "        |  5. Exit : exits program                    |"
    puts "        |___________________________________ˎ₍•ʚ•₎ˏ___|"
  end

  def self.list_of_genres
    puts `clear`
    puts "         _______(๑•᎑< ๑)♡______________________________"
    puts "        | Type the number of genre you are interested: |"
    puts "        |               1. Action                      |"
    puts "        |               2. Comedy                      |"
    puts "        |               3. Science Fiction             |"
    puts "        |               4. Romance                     |"
    puts "        |               5. Horror                      |"
    puts "        |               6. Mystery                     |"
    puts "        |               7. All                         |"
    puts "        |               b. Back to help                |"
    puts "        |___________________________________ฅ^._.^ฅ____|"
  end

  def self.prompt
    puts " "
    puts "- Please enter a command:"
    puts " "
    gets.chomp.downcase
  end

  def self.run
    self.help
    input = self.prompt()
    if input == "1" || input == "help"
      self.run
    elsif input == "2" || input == "genres"
      self.genres
    elsif input == "3" || input == "my favorites"
      self.favorite
    elsif input == "4" || input == "change your username"
      self.changing_name
    elsif input == "5" || input == "exit"
      return self.exit
    else
      puts "- Invalid command"
    end
  end

  def self.changing_name
    User.change_name
    self.run
  end

  def self.genres
    self.list_of_genres
    input = self.prompt()
    if input == "1" || input == "action"
      Movie.action
    elsif input == "2" || input == "comedy"
      Movie.comedy
    elsif input == "3" || input == "science fiction"
      Movie.science_fiction
    elsif input == "4" || input == "romance"
      Movie.romance
    elsif input == "5" || input == "horror"
      Movie.horror
    elsif input == "6" || input == "mystery"
      Movie.mystery
    elsif input == "7" || input == "all"
      Movie.all_movies
    elsif input == "b" || input == "back"
      return self.run
    else
      puts "- Invalid command"
    end
    Favorite.choice_of_movie
    self.genres
  end

  def self.favorite
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
      return self.run
    else
      puts "- Invalid Command"
    end
    self.favorite
  end

  def self.exit
    puts "- Successfully Logged Out"
    return
  end
end
