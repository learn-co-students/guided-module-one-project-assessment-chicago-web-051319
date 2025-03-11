class Order < ActiveRecord::Base
    belongs_to :rice
    belongs_to :filling

    before_save :set_total_price

    def set_total_price
        self.total_price = self.rice.price + self.filling.price
    end
end
