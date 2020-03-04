class SessionsController < ApplicationController

    def new

    end

    def create
      client = Client.find_by_mail(params[:mail])
      if client && client.authenticate(params[:password])
        session[:user_id] = client.id
        redirect_to new_panier_path
      else
        flash.now[:alert] = "Email or password is invalid"
        render "new"
      end

    end

    def destroy
      session[:user_id] = nil
      redirect_to homes_path, notice: "Logged out!"
    end

end