class AttendancesController < ApplicationController
  def create
    @attendance = Attendance.new(attendance_params)
    classroom = @attendance.classroom
    
    if @attendance.save
      flash[:notice] = "Thank you for completing attendance for the #{classroom.name} Class."
      redirect_to root_path
    else
      flash[:notice] = "We have hit a snag."
      redirect_back(fallback_location: root_path)
    end    
  end
  
  private
  
  def attendance_params
    params.require(:attendance).permit(:classroom_id, :teacher_id, student_ids: [])
  end
end

