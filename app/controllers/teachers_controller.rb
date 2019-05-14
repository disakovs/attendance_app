class TeachersController < ApplicationController
  before_action :set_teacher, only: [:edit, :update, :destroy]
  before_action :require_admin

  def index
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
  end
  
  def update
    if @teacher.update(teacher_params)
      flash.now[:notice] = 'You successfully updated the teacher'
      redirect_to teachers_path
    else 
      render :edit
    end
  end
  
  def destroy
    @teacher.destroy
    flash[:notice] = 'You deleted #{@teacher.first_name}'
    redirect_to teachers_path
  end
  
  private
  
  def teacher_params
    params.require(:teacher).permit!
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end
end

