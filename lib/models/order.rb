class Order < ActiveRecord::Base
    belongs_to :rice
    belongs_to :filling
end
