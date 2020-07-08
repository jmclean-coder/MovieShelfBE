class UsersController < ApplicationController
  def index
    users = User.all
    render json: users, except: [:created_at, :updated_at]
  end

  def show
    user = user.find_by(params[:id])
    if user
      render json: user, except: [:created_at, :updated_at]
    else
      render json: {message: 'We cannot find that user'}
    end
  end

  def create
  end

  def update
  end

  def destroy
  end
end
