class StudentsController < ApplicationController
  before_action :set_student, only: [:edit, :update]

  def index
    @students = Student.all
  end

  def create
    @classroom = Classroom.find(params[:classroom_id])
    @student = @classroom.students.build(params.require(:student).permit!)
    
    if @student.save
      flash[:notice] = 'Student Added to Class'
      redirect_to classroom_path(@classroom)
    else
      flash[:notice] = 'Student not saved'
      render 'classrooms/show'
    end
  end
  
  def edit
    @classroom = Classroom.find(params[:classroom_id])
    @classrooms = Classroom.all
  end
  
  def update
    
    if @student.update(student_params)
      flash.now[:notice] = "You successfully updated the student's information"
      redirect_to classroom_path(params[:classroom_id])
    else 
      render :edit
    end
  end
  
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    flash[:notice] = "You deleted #{@student.full_name}"
    redirect_back(fallback_location: root_path)
  end
  
  
  private
  
  def student_params
    params.require(:student).permit!
  end
  
  def set_student
    @student = Student.find(params[:id])
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

