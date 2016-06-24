class UsersController < ApplicationController
  def new
    @user = User.new

  end

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.

      redirect_to @user
      flash[:success] = "Welcome to the Sample App!"

    else
      flash[:failure] = "Come on, you can do better than that...!"

      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

