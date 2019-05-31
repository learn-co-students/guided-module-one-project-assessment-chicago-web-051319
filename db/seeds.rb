require 'pry'

############Seeded#############
Movie.create(title: "Avengers", genre_id: 1)
Movie.create(title: "Silent Hill", genre_id: 5)
Movie.create(title: "Inseption", genre_id: 3)
Movie.create(title: "Bruce AlMighty", genre_id: 2)
Movie.create(title: "About Time", genre_id: 4)
Movie.create(title: "Sherlock Holmes", genre_id: 6)
Movie.create(title: "Pizza", genre_id: 2)
Movie.create(title: "Milkshake", genre_id: 4)
Movie.create(title: "Banana", genre_id: 5)
Movie.create(title: "BerryBerry", genre_id: 1)

Genre.create(genre_type: "Action")
Genre.create(genre_type: "Commedy")
Genre.create(genre_type: "Schience Fiction")
Genre.create(genre_type: "Rommance")
Genre.create(genre_type: "Horror")
Genre.create(genre_type: "Mystery")
##############################


#######From Lecture Example#########
# User.create(username: "Rocko1999", age: 22)
# Hat.create(name: "Cool Breeze", color: "blue")
#
# Sale.create(quantity: 1, user_id: 1, hat_id: 1)
#
# puts User.first
# puts Sale.all
# puts User.find(1)
#
# puts User.first.sales
# def sales
# Sale.where(user_id: self.id)
# end

######################################################################
##sources only use for case when they used through relations
##but they use foreign_key when they change class stuff then, foreign_key
######################################################################
#has_many :purchased_hats, through: sales, source: :hat
#has_many :hats, foreign_key: :creator_id

#belongs_to :owner, class_name: :Stidemt, foreign_key: :student_id
