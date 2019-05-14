class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :edit, :update]
  before_action :require_user
  before_action :require_admin, except: [:index, :show]

  def index
    @parkour_classes = Classroom.all.select{|c| c.classroom_type == 'parkour'}
    @gymnastics_classes = Classroom.all.select{|c| c.classroom_type == 'gymnastics'}
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
end

