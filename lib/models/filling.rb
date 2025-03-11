class Filling < ActiveRecord::Base
    has_many :orders
    has_many :rice, through: :orders

    def display_info
        "                #{id}. #{name} ($#{price})"
    end

end

