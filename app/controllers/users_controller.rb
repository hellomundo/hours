class UsersController < ApplicationController
  before_action :signed_in_user, except: [:new, :create]
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @users = User.all
    if(params[:since])
      @users = User.all
      @day = Date.parse(params[:since])
      @nice_day = @day.strftime("%A %B %d, %Y")
      #day = d.beginning_of_week.strftime
      @efforts = Effort.where("performed_on >= :d", {d: @day})
      @groups = @efforts.group_by(&:user_id)
      #for each in groups
      # @b = User.joins(:efforts).where("performed_on >= :d", {d: Time.now.beginning_of_year})

    else
      @day = Date.new(2013, 1, 1)
      @nice_day = "the beginning of time"
      @users = User.all
    end
  end
  
  def show
    @user = User.find(params[:id])
    @efforts = @user.efforts
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Start Clocking that Time!"
      redirect_to @user
    else 
      flash[:notice] = "We have a problem, Houston"
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
  
  def send_reminder_email
    @user = User.find(params[:id])
    UserMailer.reminder_email(@user).deliver
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :default_rate, :password, :password_confirmation)
    end
    
  #before filters
  
  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      flash[:edit] = "You can't edit somebody else's profile."
      redirect_to(root_url)
    end
  end
  
    
end
