class Rice < ActiveRecord::Base
    has_many :orders 
    has_many :fillings, through: :orders
end
