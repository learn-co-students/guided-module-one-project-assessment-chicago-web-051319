class CreateOrders < ActiveRecord::Migration[4.2]
    def change
        create_table :orders do |t|
            t.string :name
            t.integer :rice_id
            t.integer :filling_id
            t.integer :total_price
            t.string :user_name
        end
    end
end

