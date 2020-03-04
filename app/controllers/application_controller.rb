class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        if session[:user_id]
            @client ||= Client.find(session[:user_id])
        else
            @client = nil
        end
    end

end
