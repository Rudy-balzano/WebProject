class ApplicationController < ActionController::Base

    helper_method :current_user
    helper_method :current_admin

    def current_user
        if session[:user_id] && Client.exists?(session[:user_id])
            @client ||= Client.find(session[:user_id])
        else
            @client = nil
        end
    end

    def current_admin
        if session[:admin_id] && Admin.exists?(session[:admin_id]) 
            @admin ||= Admin.find(session[:admin_id])
        else
            @admin = nil
        end
    end
        

end
