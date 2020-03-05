class SessionsController < ApplicationController

    def new

    end

    def create

      if !Client.find_by_mail(params[:mail]).nil?
        client = Client.find_by_mail(params[:mail])
        if client && client.authenticate(params[:password])
          session[:user_id] = client.id
          redirect_to new_panier_path
        else
          flash.now[:alert] = "Invalid password"
          render "new"
        end
      elsif !Admin.find_by_mail(params[:mail]).nil?
        admin = Admin.find_by_mail(params[:mail])
        if admin && admin.authenticate(params[:password])
          session[:user_id] = admin.id
          redirect_to homes_path
        else
          flash.now[:alert] = "Invalid password"
        end
      else
        flash.now[:alert] = "Invalid email"
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to homes_path
    end

end