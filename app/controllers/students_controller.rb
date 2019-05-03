class StudentsController < ApplicationController
  before_action :set_student, only: [:edit, :update]
  before_action :require_user

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
end

