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
    new_user = User.new(user_params)
    if new_user.valid?
      new_user.save
      render json: UserSerializer.new(new_user), status: 201
    else
      render :json: {errors: new_user.errors.full_messages}
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.valid?
      render json: UserSerializer.new(user)
    else
      render json: {errors: user.errors.full_messages}
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: UserSerializer.new(user)
  end

  def user_params
    params.requre(:user).permit(:username, :password_digest)
  end
end
