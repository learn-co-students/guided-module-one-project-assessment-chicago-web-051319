require 'pry'

class User < ActiveRecord::Base
  has_many :favorites
  has_many :movies, through: :favorites

  def self.prompt()
    puts " "
    puts "- Please Enter your Name: "
    puts " "
    gets.chomp
  end

  def self.message
    puts "                           ヾ(๑╹ヮ╹๑)ﾉ”"
    puts "           #########################################"
    puts "               Welcome to the Movie Finder #{@input}!"
    puts "           #########################################"
    puts " "
  end

  def self.sign_in
    puts "- What is your name?"
    @input = prompt
    self.message
    User.find_or_create_by name: @input
    puts " "
    puts " "
    i = 3
    puts "LOADING"
    4.times do
      sleep(1)
      puts "#{i}..."
      i -= 1
    end
  end

  def self.all_user
    self.all
  end

  def self.finding_user
    self.find_by name: @input
  end


  def self.username()
    puts "- What is your current username?"
    puts "- Type b to go back"
    puts " "
    gets.chomp
  end

  def self.modify_name()
    puts "- Enter a new username:"
    puts " "
    gets.chomp
  end

  def self.show_user_name
    @input
  end

  def self.change_name
    user_name = self.finding_user.name
    received_name = self.username()
    if user_name != nil && received_name == user_name
      @input = self.modify_name()
      this_user = User.find_by(name: received_name)
      this_user.update(name: @input)
      puts "Your username has successfully changed to #{@input}."
    else
      puts "- Invalid user name"
      return
    end
  end

end
