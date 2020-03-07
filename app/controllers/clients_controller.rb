class ClientsController < ApplicationController

    before_action :set_client, only: [:update, :destroy, :edit, :show]
  
    def index

      @clients = Client.all
  
    end
  
    def show
  
    end
  
    def update
  
      @client.update(client_params)
      flash[:notice] = "Your account has been modified" 
      redirect_to '/clients'
  
    end
  
    def edit
  
  
    end
  
    def destroy
  
      cookies.delete(:user_id)
      @client.destroy
      if !current_admin.nil?
        redirect_to clients_path
      else 
        redirect_to homes_path
      end
  
    end
  
    def new

      @client = Client.new
  
    end
  
  
    def create
  
      @client = Client.new(client_params)
  
      if @client.save
        redirect_to homes_path
      else
        render 'new'
      end
  
  
    end
  
  
    private

    #La fonction set_client est differente en foncton de si un client ou un admin en fait la requette : 
    #   - Si la requette vient d'un client, la fonction renvoie le client en question
    #   - Si la requette vient d'un admin, la fonction renvoie le client demandé
  
    def set_client  

      if !current_user.nil?
        @client = Client.find(cookies[:user_id]) 
      elsif !current_admin.nil?
        @client = Client.find(params[:id])
      end

    end
  
    def client_params

      params.require(:client).permit(:nom, :prenom, :rue, :numero, :ville, :codePostal, :password, :mail, :password_confirmation)

    end
  
  end
  