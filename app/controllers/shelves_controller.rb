class ShelvesController < ApplicationController
  def show
    shelf = Shelf.find(params[:id])
    render json: ShelfSerializer.new
  end

  def create
    shelf = Shelf.create(shelf_params)
    if shelf.valid?
      render json: ShelfSerializer.new
    else
      render json: {errors: shelf.errors.full_messages}
    end
  end

  def update
    shelf = Shelf.find(params[:id])
    shelf.update(shelf_params)
    if shelf.valid?
      render json: ShelfSerializer.new(shelf)
    else
      render json: {errors: shelf.errors.full_messages}
    end
  end

  def destroy
    shelf = Shelf.find(params[:id])
    shelf.destroy
    render json: ShelfSerializer.new(shelf)
  end

  private

  def shelf_params
    params.require(:shelf).permit(:user_id)
  end
end
