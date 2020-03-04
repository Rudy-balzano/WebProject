class ClientsController < ApplicationController

    before_action :set_client, only: [:index, :update, :destroy, :edit]
  
    def index
  
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
  
      session.delete(:client_id)
      @client.destroy
      redirect_to new_client_path
  
    end
  
    def new
  
    end
  
  
    def create
  
      @client = Client.new(client_params)
  
      if @client.save
        redirect_to home_path
      else
        flash[:danger] = "The account has not been created"
        redirect_to new_client_path
      end
  
  
    end
  
  
    private
  
    def set_client
      cookies.delete(:remember_token)
  
      @client = Client.find_by(cookies[:remember_token])
  
    end
  
    def client_params
      params.require(:client).permit(:nom, :prenom, :rue, :numero, :ville, :codePostal, :password, :mail, :password_confirmation)
    end
  
  end
  