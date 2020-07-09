class ShelvesController < ApplicationController

  def index
    shelves = Shelf.all
    render json: shelves
  end

  def show
    shelf = Shelf.find(params[:id])
    render json: {shelf: ShelfSerializer.new(shelf)}
  end

  def create
    shelf = Shelf.create(shelf_params)
    if shelf.valid?
      render json: { shelf: ShelfSerializer.new(shelf) }, status: :created
    else
      render json: {errors: shelf.errors.full_messages}
    end
  end

  def update
    shelf = Shelf.find(params[:id])
    shelf.update(shelf_params)
    if shelf.valid?
      render json: {shelf: ShelfSerializer.new(shelf)}
    else
      render json: {errors: shelf.errors.full_messages}
    end
  end

  def destroy
    shelf = Shelf.find(params[:id])
    shelf.destroy
    render json: {message: "Shelf Deleted!" }, status: :ok
  end

  private

  def shelf_params
    params.require(:shelf).permit(:user_id)
  end
end
