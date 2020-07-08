class MoviesController < ApplicationController

  def index
    movies = Movie.all
    render json: movies, except: [:created_at, :updated_at]
  end

  def show
    movie = Movie.find_by(id: params[:id])
    if movie
      render json: movie, except: [:created_at, :updated_at]
    else
      render json: {message: 'Movie not found'}
    end
  end

  def create
    movie = Movie.create(movie_params)
    if movie.valid?
      render json: MovieSerializer.new(movie)
    else
      render json: {errors: movie.errors.full_messages}
    end
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(movie_prams)
    if movie.valid?
      render json: MovieSerializer.new(movie)
    else
      render json: {errors: movie.errors.full_messages}
    end
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    render json: MovieSerializer.new(movie)
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :year, :runtime, :poster, :genre, :imdb_id)
  end
end
