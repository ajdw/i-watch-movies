class MoviesController < ApplicationController
  # the controller is responsible for setting up the data required by the view
  # the controller prepares the data which is then generated in the view

before_action :require_signin, except: [:index, :show]
before_action :require_admin, except: [:index, :show]

  def index
    @movies = Movie.released
  end

  def show
    # assigning the instance variable of @movie to equal the Movie object and finding the associated movie by passing through the params
    # a params for the movie :id
    @movie = Movie.find(params[:id])
    @fans = @movie.fans
    if current_user
    @current_favorite = current_user.favorites.find_by(movie_id: @movie.id)
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

# if update is successful, redirect to movie show page, else, show the edit form
  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movies_url, notice: "Movie successfully updated!"
    else
      render :edit
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_url, notice: "Movie successfully saved!"
    else
      render :new
    end 
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_url, alert: "Movie successfully deleted!"
  end

private
  def movie_params
    params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :cast, :director, :duration, :image_file_name)
  end
  end
