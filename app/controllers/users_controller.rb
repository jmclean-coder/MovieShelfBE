class UsersController < ApplicationController

  def index
    users = User.all
    render json: users 
  end

  def show
    user = User.find(params[:id])
    if user
      render json: { user: UserSerializer.new(user) }, status: :accepted
    else
      render json: {message: 'We cannot find that user'}, status: :not_found
    end
  end

  def create
    user = User.create(user_params)
    if user.valid?
      render json: { user: UserSerializer.new(user) }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :not_acceptable
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.valid?
      render json: { user: UserSerializer.new(user) }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :not_acceptable
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {user: user} 
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
