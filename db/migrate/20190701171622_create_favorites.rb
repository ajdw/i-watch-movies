class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
    	# references is a shortcut for adding a foreign key column
    	# t.references :movie generates a movie_id
      t.references :movie, foreign_key: true
      	# t.references :user generates a user_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
