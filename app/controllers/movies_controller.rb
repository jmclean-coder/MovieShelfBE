class MoviesController < ApplicationController

  def index
    movies = Movie.all
    render json: movies, except: [:created_at, :updated_at]
  end

  def show
    movie = Movie.find_by(id: params[:id])
    if movie
      render json: { movie: MovieSerializer.new(movie) }, status: :ok 
    else
      render json: { message: 'Movie not found' }, status: :not_found
    end
  end

  def create
    # movie = Movie.find_or_create_by(movie_params)
    if Movie.find_by(imdb_id: movie_params["imdb_id"])
      movie = Movie.find_by(imdb_id: movie_params["imdb_id"])
    else
      movie = Movie.create(movie_params)
    end
    shelf_movie = MovieShelf.find_or_create_by(movie_id: movie.id, shelf_id: 1)
    # byebug
    if movie.valid?
      render json: { movie: MovieSerializer.new(movie) }, status: :created
    else
      render json: { message: movie.errors.full_messages }
    end
  end

  def update
    # byebug
    movie = Movie.find(params[:id])
    movie.update(movie_params)
    if movie.valid?
      render json: { movie: MovieSerializer.new(movie) }, status: :accepted
    else
      render json: { errors: movie.errors.full_messages } 
    end
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    render json: {message: 'Movie deleted'}
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :year,:poster, :genre, :imdb_id)
  end
end
