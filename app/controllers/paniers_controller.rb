class PaniersController < ApplicationController

    def show

        @panier = Panier.find_by_id(cookies[:panier])
        @articles = Contient.where(numPanier: cookies[:panier])

    end

    def new

        create

    end

    def create
        @panier = Panier.new
        @panier.numUser = session[:user_id]
        @panier.save
        cookies[:panier] = @panier.id
        redirect_to homes_path
        
    end

    def index

        @paniers = Panier.all

    end

end