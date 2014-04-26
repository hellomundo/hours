class ClientsController < ApplicationController
  before_action :signed_in_user

  def index
    @clients = Client.active
    @inclients = Client.inactive
  end
  
  def new
    @client = Client.new
  end
  
  def create
    @client = Client.new(client_params)
    if(@client.save)
      redirect_to @client
    else
      #flash something
      render 'new'
    end
  end
  
  def show
    @client = Client.find(params[:id])
    @projects = @client.projects
    
  end
  
  def edit
    @client = Client.find(params[:id])
  end
  
  def update
    @client = Client.find(params[:id])
    if(@client.update(client_params))
      redirect_to @client
    else
      #flash something
      render 'edit'
    end
  end
  
  def toggle_activation
    @client = Client.find(params[:id])
    @client.deactivate
    if(@client.save)
      redirect_to @client
    else
      #flash something
      redirect_to @client
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    
    redirect_to clients_path
  end
  
  private
  
    def client_params
      params.require(:client).permit(:name, :is_active)
    end
end
