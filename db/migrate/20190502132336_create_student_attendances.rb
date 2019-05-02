class CreateStudentAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :student_attendances do |t|
      t.integer :student_id, :attendance_id
      
      t.timestamps
    end
  end
end
