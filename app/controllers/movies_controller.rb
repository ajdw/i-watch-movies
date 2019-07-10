class MoviesController < ApplicationController
  # the controller is responsible for setting up the data required by the view
  # the controller prepares the data which is then generated in the view

before_action :require_signin, except: [:index, :show]
before_action :require_admin, except: [:index, :show]

  def index
    case params[:scope]
    when 'hits'
      @movies = Movie.hits  
    when 'flops'
      @movies = Movie.flops
    when 'upcoming'
      @movies = Movie.upcoming
    when 'recent'
      @movies = Movie.recent
    else
      @movies = Movie.released
    end
  end

  def show
#instance variable @movie assigned Movie object, method to find, and parameters with :id of associated movie
    @movie = Movie.find(params[:id])
    @fans = @movie.fans
    @genres = @movie.genres

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
    params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :cast, :director, :duration, :image_file_name, genre_ids: [])
  end
end
