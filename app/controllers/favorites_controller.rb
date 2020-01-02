class FavoritesController < ApplicationController
	before_action :require_signin
	# run this custom method before running any action code
	before_action :set_movie

	def create 
		#association
		@movie.favorites.create!(user: current_user)
		redirect_to @movie, notice: "Thanks for the favoriting!"
	end

	def destroy
		favorite = current_user.favorites.find(params[:id])
		favorite.destroy
		redirect_to @movie, notice: "Sorry you unfaved it!"
	end

# private method
private
	def set_movie
		@movie = Movie.find_by!(slug: params[:movie_id])
	end
end
