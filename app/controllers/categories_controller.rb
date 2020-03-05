class CategoriesController < ApplicationController

    def create 

        @categorie = Categorie.new(categorie_params)
        @categorie.save
        redirect_to articlespath

    end

    def new

    end

end
