class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # show utilizes the Active Record find method
  end

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    # create calls the Active Record new method

    if @user.save
      log_in @user
      flash[:success] = "Welcome to FleetMED!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
    # update calls the Active Record update_attributes method
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    # destroy calls the Active Record destroy method
    flash[:success] = "User deleted"
    redirect_to users_url
    # redirect_to is an ApplicationController method
  end

  private
  #private methods are methods which only need to be exposed to scope of its' controller and not the template

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
    # this method contains a set of instructions to run before any controller action is called - since it will be passed as an argument to before_action
      unless logged_in?
      # if user is not logged in, run the following
        store_location
        # store_location saves the requested url to sessions under the key :forwarding_url
        flash[:danger] = "Please log in."
        # message to user indicating why they were redirected to the login page
        redirect_to login_url
        # redirect to login page
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
