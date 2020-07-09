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
    movie = Movie.new(movie_params)
    if movie.valid?
      movie.save
      render json: { movie: MovieSerializer.new(movie) }, status: :created
    else
      render json: { message: movie.errors.full_messages }
    end
  end

  def update
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
    params.require(:movie).permit(:title, :year, :runtime, :poster, :genre, :imdb_id)
  end
end
