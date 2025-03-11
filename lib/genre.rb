require 'pry'

class Genre < ActiveRecord::Base
  has_many :movies

end
