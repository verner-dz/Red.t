class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @user.update(admin: false)
    session[:user_id] = @user.id
    redirect_to @user
  end

  # def edit
  #   @user = User.find(params[:id])
  # end

  # def update
  #   @user = User.find(params[:id])
  #   @user.update(user_params)
  # end

  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   session[:user_id] = nil
  #   redirect_to root_path
  # end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
