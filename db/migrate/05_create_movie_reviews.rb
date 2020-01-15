class CreateMovieReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :movie_reviews do |t|
      t.string :body
      t.integer :rating
      t.belongs_to :user, index: true
      t.belongs_to :movie, index: true
    end
  end
end