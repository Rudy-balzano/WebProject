class SessionsController < ApplicationController

    def new

    end

    def create

      if !Client.find_by_mail(params[:mail]).nil?               #On regarde si les parametres correspondent a un client
        client = Client.find_by_mail(params[:mail])

        if client && client.authenticate(params[:password])     #On verifie que le password et le bon
          cookies[:user_id] = client.id                         #On créee la session correspondante
          redirect_to new_panier_path
        else
          flash[:alert] = "Invalid password"
          redirect_to new_session_path
        end

      elsif !Admin.find_by_mail(params[:mail]).nil?             #De meme pour l'admin
        admin = Admin.find_by_mail(params[:mail])

        if admin && admin.authenticate(params[:password])
          cookies[:admin_id] = admin.id
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

        cookies.delete(:user_id)
      else
        cookies.delete(:admin_id)
      end

      cookies.delete(:panier)
      redirect_to homes_path
      
    end

end