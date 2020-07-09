class UsersController < ApplicationController

  def index
    users = User.all
    render json: { users, except: [:created_at, :updated_at] } 
  end

  def show
    user = User.find(params[:id])
    if user
      render json: {UserSerializer.new(user)}
    else
      render json: {message: 'We cannot find that user'}
    end
  end

  def create
    user = User.create(user_params)
    if new_user.valid?
      render json: { user: UserSerializer.new(@user) }, status: :created
    else
      render json: {errors: user.errors.full_messages}
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
    render json: {user, except: [:created_at, :updated_at]} 
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
