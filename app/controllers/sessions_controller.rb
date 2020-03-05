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
          flash[:alert] = "Invalid password"
          redirect_to new_session_path
        end
      elsif !Admin.find_by_mail(params[:mail]).nil?
        admin = Admin.find_by_mail(params[:mail])
        if admin && admin.authenticate(params[:password])
          session[:admin_id] = admin.id
          flash[:alert] = "vnvnv"

          redirect_to homes_path
        else
          flash[:alert] = "Invalid password"
        end
      else
        flash[:alert] = "Invalid email"
        redirect_to new_session_path
      end
    end

    def destroy
      if !current_user.nil?
        if !Panier.find(cookies[:panier]).valide
          Panier.delete(cookies[:panier])
        end
        session.delete(:user_id)
      else
        session.delete(:admin_id)
      end
      cookies.delete(:panier)
      redirect_to homes_path
    end

end