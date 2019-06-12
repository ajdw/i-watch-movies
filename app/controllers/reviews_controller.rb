class ReviewsController < ApplicationController

	def index
		# @movies is a variable that's assigned to Movie with a method that will find, by parameters, the movie_id
		@movie = Movie.find(params[:movie_id])
		# @reviews is a variable that's assigned to that specific movie and its reviews
		@reviews = @movie.reviews
	end

end
