class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :rating
      t.string :genre
      t.string :actors
      t.string :directors
      t.string :released
      t.string :awards
      t.string :budget
      t.string :revenue
      t.string :country
      t.string :languages
    end
  end
end
