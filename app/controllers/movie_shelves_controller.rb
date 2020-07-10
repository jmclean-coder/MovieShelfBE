class MovieShelvesController < ApplicationController
    def index
        movie_shelves = MovieShelf.all
        render json: movie_shelves
    end
    

    def destroy
        shelved_movie = MovieShelf.find(params[:id])
        shelved_movie.destroy
        render json: {message: "Movie removed from shelf"}, status: :ok
    end
end
