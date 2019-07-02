class ReviewsController < ApplicationController
	# use a built-in rails control action method (before_action) with our custom :require_signin method
	before_action :require_signin
	before_action :set_movie

	def index
		# @reviews is a variable that's assigned to that specific movie and its reviews
		@reviews = @movie.reviews
	end

	def new
		# We are assigning the @review variable equal to a new movie review
		@review = @movie.reviews.new
	end

	def create
		@review = @movie.reviews.new(review_params)
		@review.user = current_user
		if @review.save
			redirect_to movie_reviews_path(@movie), 
			notice: "Thank you for your review!"
		else
			render :new
		end

	private 
	def review_params
		params.require(:review).permit(:comment, :stars)
	end

	def set_movie
		# @movies is a variable that's assigned to Movie with a method that will find, by parameters, the movie_id
		@movie = Movie.find(params[:movie_id])
	end



end
