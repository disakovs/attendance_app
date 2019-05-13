class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :require_admin
  
  def index
    @users = User.all
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:notice] = "You have registered a new #{@user.role}."
      redirect_to root_path
    else
      render :index
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:notice] = "#{@user.username} profile is updated"
      redirect_to root_path
    else
      render :edit
    end
  
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password, :role)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
