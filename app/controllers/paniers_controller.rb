class PaniersController < ApplicationController

    def index

    end

    def new

        create
        
    end

    def create

        @panier = Panier.new
        @panier.numUser = session[:user_id]

        if @panier.save
            cookies.permanent[:panier]
        end

        redirect_to homes_path, notice: "Logged in!"
        
    end

end