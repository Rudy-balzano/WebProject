class PaniersController < ApplicationController

    def show

        @panier = Panier.find_by_id(cookies[:panier])
        @articles = Contient.where(numPanier: cookies[:panier])

    end

    def new

        create

    end

    def create

        if Panier.find_by_numUser(session[:user_id])
            @panier = Panier.find_by_numUser(session[:user_id])
            cookies[:panier] = @panier.id
        else

            @panier = Panier.new
            @panier.numUser = session[:user_id]

            @panier.save
            cookies[:panier] = @panier.id
            
        end

        redirect_to homes_path
        
    end

end