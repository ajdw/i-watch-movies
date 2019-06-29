class MakeReviewsAJoinTable < ActiveRecord::Migration[5.0]
  def up
  	#destroy all the review objects using dot notation with method delete_all
  	Review.delete_all
  	#remove_column takes the name of the table and the name of the column 
  	remove_column :reviews, :name
  	#add_column takes the name of the table, the name of the column, adn the column type
  	add_column :reviews, :user_id, :integer 
  end

  def down
  	Review.delete_all
  	remove_column :reviews, :user_id
  	add_column :reviews, :name, :string
  end

end
