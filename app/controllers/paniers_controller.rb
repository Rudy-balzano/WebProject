class PaniersController < ApplicationController

    before_action :set_panier, only: [:show, :confirm, :destroy]

    def show

        @articles = Contient.where(numPanier: cookies[:panier])
        @prixpanier = 0

        @articles.each do |a| 
            article = Article.find_by_id(a.numArticle)
            @prixpanier += article.prix
        end

    end

    def new

        create

    end

    def create

        @panier = Panier.new
        @panier.numUser = cookies[:user_id]
        @panier.save
        cookies[:panier] = @panier.id
        redirect_to homes_path
        
    end

    def destroy

        @panier = Panier.find(params[:id])
        @panier.destroy
        redirect_to paniers_path

    end

    def index

        @paniers = Panier.where(valide: true)

    end

    #La methode confirm sauvegarde le panier pour que l'admin puisse le voir, et crée un autre panier pour que le client
    #puisse continuer ses achats

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