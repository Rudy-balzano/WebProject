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
  
      session.delete(:user_id)
      @admin.destroy
      redirect_to homes_path
  
    end
  
    def new
  
    end
  
  
    def create
  
      @admin = Admin.new(admin_params)
  
      if @admin.save
        redirect_to homes_path
      else
        flash[:danger] = "The account has not been created"
        redirect_to new_admin_path
      end
  
  
    end
  
  
    private
  
    def set_admin  
      @admin = Admin.find(session[:user_id])
  
    end
  
    def admin_params
      params.require(:admin).permit(:nom, :prenom, :password, :mail, :password_confirmation)
    end
  
  end
  