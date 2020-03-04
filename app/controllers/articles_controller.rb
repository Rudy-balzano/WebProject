class ArticlesController < ApplicationController
    before_action :set_article, only: [:update, :show, :edit, :destroy]
  
    def index

      @articles = Article.all
  
    end
  
    def show

      cookies.delete(:last_article)
      cookies[:last_article] = @article.id
  
    end
  
    def edit
  
    end
  
    def update
      @article.update(article_params)
  
      flash[:notice] = "Your article has been modified"
  
      redirect_to '/articles'
    end
  
    def new
  
    end
  
    def create

      @article = Article.new(article_params)
      @article.save
      redirect_to @article
      
    end
  
    def destroy
  
      @article.destroy
      redirect_to '/articles'
    end
  
  
    private
  
    def article_params
      params.require(:article).permit(:libelle)
    end
  
    def set_article
      @article = Article.find(params[:id])
    end
  
  end