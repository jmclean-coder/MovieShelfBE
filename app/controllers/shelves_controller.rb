class ShelvesController < ApplicationController

  def index
    shelves = Shelf.all
    render json: shelves, except: [:created_at, :updated_at]
  end

  def show
    shelf = Shelf.find(params[:id])
    render json: shelf, except: [:created_at, :updated_at]
  end

  def create
    shelf = Shelf.new(shelf_params)
    if shelf.valid?
      shelf.save
      render json: shelf, except: [:created_at, :updated_at]
    else
      render json: {errors: shelf.errors.full_messages}
    end
  end

  def update
    shelf = Shelf.find(params[:id])
    shelf.update(shelf_params)
    if shelf.valid?
      render json: shelf, except: [:created_at, :updated_at]
    else
      render json: {errors: shelf.errors.full_messages}
    end
  end

  def destroy
    shelf = Shelf.find(params[:id])
    shelf.destroy
    render json: shelf, except: [:created_at, :updated_at]
  end

  private

  def shelf_params
    params.require(:shelf).permit(:user_id)
  end
end
