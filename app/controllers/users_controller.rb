class UsersController < ApplicationController
  def index
    users = User.all
    render json: users, except: [:created_at, :updated_at]
  end

  def show
    user = User.find(params[:id])
    if user
      render json: user, except: [:created_at, :updated_at]
    else
      render json: {message: 'We cannot find that user'}
    end
  end

  def create
    new_user = User.new(user_params)
    if new_user.valid?
      new_user.save
      render json: user, except: [:created_at, :updated_at]
    else
      render json: {errors: new_user.errors.full_messages}
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.valid?
      render json: user, except: [:created_at, :updated_at]
    else
      render json: {errors: user.errors.full_messages}
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user, except: [:created_at, :updated_at]
  end

  def user_params
    params.requre(:user).permit(:username, :password_digest)
  end
end
