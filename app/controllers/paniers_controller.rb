class PaniersController < ApplicationController

    before_action :set_panier, only: [:show, :confirm]

    def show

        @articles = Contient.where(numPanier: cookies[:panier])
        @confirmed = @panier.valide

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

    def confirm
        @panier.valide = true
        flash[:notice] = "Your cart has been confirmed"
        create
    end


    private

    def set_panier
        @panier = Panier.find_by_id(cookies[:panier])
    end
  

end