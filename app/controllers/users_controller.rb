class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @playlist = @user.songs
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to "/songs"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/mains"
    end
  end
private

  def user_params
    params.require(:user).permit(:first_name,:last_name, :email, :password)
  end
end
