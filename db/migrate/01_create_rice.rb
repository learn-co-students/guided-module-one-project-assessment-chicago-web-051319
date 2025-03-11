class CreateRice < ActiveRecord::Migration[4.2]
    def change
        create_table :rice do |t|
            t.string :name
            t.integer :price
        end
    end
end

