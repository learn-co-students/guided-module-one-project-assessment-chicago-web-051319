class Filling < ActiveRecord::Base
    has_many :orders
    has_many :rice, through: :orders
end

