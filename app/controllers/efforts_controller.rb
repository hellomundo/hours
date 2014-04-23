class EffortsController < ApplicationController
  before_action :signed_in_user

  def create
    @effort = Effort.new(effort_params)
    
    @effort.user_id = current_user.id
    
    if(@effort.save)
      redirect_to root_path
    else
      #flash something
      render 'new'
    end
  end
  
  def destroy
    @effort = Effort.find(params[:id])
    @effort.destroy
    
    redirect_to root_path
  end
  

  private
  
    def effort_params
      params.require(:effort).permit(:user_id, :project_id, :duration, :performed_on, :rate, :description, :hours )
    end
  
end
