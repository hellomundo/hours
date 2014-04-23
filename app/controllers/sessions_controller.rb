class SessionsController < ApplicationController

  before_action :signed_in_user, except: [:new, :create]

  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # sign them in
      sign_in user
      redirect_back_or user
    else
      # create error and re-render
      flash.now[:error] = "Your email or password wasn't right"
      render 'new'
    end
    
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
  
end
