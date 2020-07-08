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
  end

  def update
  end

  def destroy
  end
end
