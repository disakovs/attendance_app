class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.references :classroom, foreign_key: true
      
      t.timestamps
    end
  end
end
