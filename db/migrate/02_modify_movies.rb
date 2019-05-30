class ModifyMovies < ActiveRecord::Migration[5.1]
    def change
      remove_column :movies, :budget
      remove_column :movies, :revenue
    end
  end