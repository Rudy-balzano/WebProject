class ApplicationController < ActionController::Base

    #helper_method permet d'utiliser les fonctions current_user et current_admin sur toutes les pages html

    helper_method :current_user
    helper_method :current_admin

    #Ces fontions permettent de verifier qu'un admin ou un client est bien connecté et le stock dans une variable 


    def current_user

        if cookies[:user_id] && Client.exists?(cookies[:user_id])
            @client ||= Client.find(cookies[:user_id])
        else
            @client = nil
        end

    end

    def current_admin

        if cookies[:admin_id] && Admin.exists?(cookies[:admin_id]) 
            @admin ||= Admin.find(cookies[:admin_id])
        else
            @admin = nil
        end

    end
        

end
