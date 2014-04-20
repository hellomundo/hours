class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Start Clocking that Time!"
      redirect_to @user
    else 
      render 'new'
    end
  end
  
  def edit
    # already defined in correct_user
    # @user = User.find(params[:id])
  end
  
  def update
    # already defined in correct_user
    # @user = User.find(params[:id])
    

    if @user.update_attributes_without_requiring_password(user_params)
      flash[:success] = "OK, made those changes. You're good."
      redirect_to @user
    else 
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
    
  #before filters
  
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in!" unless signed_in?
    end
  end
  
  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      flash[:edit] = "You can't edit somebody else's profile."
      redirect_to(root_url)
    end
  end
  
    
end
