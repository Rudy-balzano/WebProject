class ContientsController < ApplicationController


    def create

        @contient = Contient.new
        @contient.numArticle = cookies[:last_article]
        @contient.numPanier = cookies[:panier]

        if @contient.save
            flash[:notice] = "Added with success"
        end

        redirect_to articles_path

    end

    def destroy
        @article = Contient.find(params[:id])
        @article.destroy
    end

end