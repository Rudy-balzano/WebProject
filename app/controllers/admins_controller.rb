class AdminsController < ApplicationController

    before_action :set_admin, only: [:index, :update, :destroy, :edit]
  
    def index
  
    end
  
    def show
  
    end
  
    def update
  
      @admin.update(admin_params)
  
      flash[:notice] = "Your account has been modified"
  
      redirect_to '/admins'
  
    end
  
    def edit
  
  
    end
  
    def destroy
  
      session.delete(:admin_id)
      @admin.destroy
      redirect_to homes_path
  
    end
  
    def new

      @admin = Admin.new
  
    end
  
  
    def create
  
      @admin = Admin.new(admin_params)
  
      if @admin.save
        redirect_to homes_path
      else
        render 'new'
      end
  
  
    end
  
  
    private
  
    def set_admin  
      @admin = Admin.find(session[:admin_id])
  
    end
  
    def admin_params
      params.require(:admin).permit(:nom, :prenom, :password, :mail, :password_confirmation)
    end
  
  end
  