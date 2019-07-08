require 'pry'

class Movie < ActiveRecord::Base
  belongs_to :genre
  has_many :favorites
  has_many :users, through: :favorites

  def self.list_of_movies
    self.all
  end

  def self.all_by_genre(genre_id)
    self.all.where("genre_id = ?", genre_id)
  end

  def self.all_movies
      puts "-------List of All Movies-------"
      puts " "
    self.list_of_movies.each do |movie|
      puts "        - #{movie.title} \n\n"
    end
    puts "----------------------------------"
  end

  def self.action
      puts "-------List of Action Movies-------"
      puts " "
    self.list_of_movies.each do |movie|
      if movie.genre_id == 1
          puts "           - #{movie.title} \n\n"
      end
    end
    puts "-----------------------------------"
  end

  def self.comedy
      puts "-------List of Commedy Movies-------"
      puts " "
    self.list_of_movies.each do |movie|
      if movie.genre_id == 2
        puts "         - #{movie.title} \n\n"
      end
    end
    puts "-------------------------------------"
  end

  def self.science_fiction
      puts "-------List of Science Fiction Movies-------"
      puts " "
    self.list_of_movies.each do |movie|
      if movie.genre_id == 3
        puts "            - #{movie.title} \n\n"
      end
    end
    puts "--------------------------------------------"
  end

  def self.romance
      puts "-------List of Rommance Movies-------"
      puts " "
    self.list_of_movies.each do |movie|
      if movie.genre_id == 4
        puts "          - #{movie.title}\n\n"
      end
    end
    puts "--------------------------------------"
  end

  def self.horror
      puts "-------List of Horror Movies-------"
      puts " "
    self.list_of_movies.each do |movie|
      if movie.genre_id == 5
        puts "         - #{movie.title}\n\n"
      end
    end
    puts "-----------------------------------"
  end

  def self.mystery
      puts "-------List of Mystery Movies-------"
      puts " "
    self.list_of_movies.each do |movie|
      if movie.genre_id == 6
        puts "        - #{movie.title}\n\n"
      end
    end
    puts "-----------------------------------"
  end
end
