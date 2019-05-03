class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :edit, :update]
  before_action :require_user
  before_action :require_admin, except: [:index, :show]

  def index
    @parkour_classes = Classroom.all.select{|c| c.classroom_type === 'parkour'}
    @gymnastics_classes = Classroom.all.select{|c| c.classroom_type === 'gymnastics'}
  end
  
  def new
    @classroom = Classroom.new
  end
  
  def show
    @student = Student.new
    @attendance = Attendance.new
  end
  
  def create
    @classroom = Classroom.create(classroom_params)
    
    if @classroom.save
      flash[:notice] = 'You successfully added a class'
      redirect_to classrooms_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    
    if @classroom.update(classroom_params)
      flash.now[:notice] = 'You successfully updated the class'
      redirect_to classrooms_path
    else 
      render :edit
    end
  end
  
  def destroy
    @classroom = Classroom.find(params[:id])
    @classroom.destroy
    flash[:notice] = 'You deleted this class'
    redirect_to classrooms_path
  end
  
  
  private
  
  def classroom_params
    params.require(:classroom).permit!
  end
  
  def set_classroom
    @classroom = Classroom.find(params[:id])
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

