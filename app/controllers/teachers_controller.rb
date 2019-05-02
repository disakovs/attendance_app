class TeachersController < ApplicationController
  def index
    #sort by first name then last name
    @teachers = Teacher.all.sort_by{|t| t.full_name }
  end
  
  def new
    @teacher = Teacher.new
  end
  
  def create
    @teacher = Teacher.create(teacher_params)
    
    if @teacher.save
      flash[:notice] = 'You successfully added a teacher'
      redirect_to teachers_path
    else
      render :new
    end
  end
  
  def edit
    @teacher = Teacher.find(params[:id])
  end
  
  def update
    @teacher = Teacher.find(params[:id])
    
    if @teacher.update(teacher_params)
      flash.now[:notice] = 'You successfully updated the teacher'
      redirect_to teachers_path
    else 
      render :edit
    end
  end
  
  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
    flash[:notice] = 'You deleted #{@teacher.first_name}'
    redirect_to teachers_path
  end
  
  
  private
  
  def teacher_params
    params.require(:teacher).permit!
  end

  
  # before_action :set_user, only: [:show, :edit, :update]
  # before_action :require_same_user, only: [:edit, :update]
  # 
  # def new
  #   @user = User.new
  # end
  # 
  # def show
  #   @user = User.find(session[:user_id])
  #   @posts = @user.posts
  #   @comments = @user.comments    
  # end
  # 
  # def create
  #   @user = User.new(user_params)
  #   
  #   if @user.save
  #     session[:user_id] = @user.id
  #     flash[:notice] = 'You are registered.'
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end
  # 
  # def edit
  # end
  # 
  # def update
  #   if @user.update(user_params)
  #     flash[:notice] = 'Your profile is updated'
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # 
  # end
  # 
  # private
  # 
  # def user_params
  #   params.require(:user).permit(:username, :password, :slug)
  # end
  # 
  # def set_user
  #   @user = User.find_by(slug: params[:id])
  # end
  # 
  # def require_same_user
  #   if current_user != @user
  #     flash[:error] = 'You do not have access'
  #     redirect_to root_path
  #   end
  # end
end

