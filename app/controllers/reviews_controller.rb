class ReviewsController < ApplicationController
	before_action :set_movie

	def index
		# @reviews is a variable that's assigned to that specific movie and its reviews
		@reviews = @movie.reviews
	end

	def new
		# We are assigning the @review variable equal to 
		@review = @movie.reviews.new
	end

	def create
		@review = @movie.reviews.new(review_params)
		if @review.save
			redirect_to movie_reviews_path(@movie), 
			notice: "Thank you for your review!"
		else
			render :new
		end
	end

	private 
	def review_params
		params.require(:review).permit(:name, :comment, :stars)
	end

	def set_movie
		# @movies is a variable that's assigned to Movie with a method that will find, by parameters, the movie_id
		@movie = Movie.find(params[:movie_id])
	end



end
