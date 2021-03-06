class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy



  def new
    @user = User.new

  end

  def index
    @users = User.paginate(page: params[:page], :per_page => 5)
  end

  def show
    @user = User.find(params[:id])
    @tidbits = @user.tidbits.paginate(page: params[:tidbit_page], :per_page => 6)
    @guides = @user.guides.paginate(page: params[:guide_page], :per_page => 6)

  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Crowdguides!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      if !current_user?(@user)
        flash[:danger] = "You may only edit your own user information. You are user #{session[:user_id]}"
        redirect_to(root_url)
      end

    end

    def admin_user
      if !current_user.admin?
        flash[:danger] = "You are not an admin."
        redirect_to(root_url)
      end

    end
end

