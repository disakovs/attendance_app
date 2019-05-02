class CreateClassrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.string :age_limit
      t.string :classroom_type
      
      t.timestamps
    end
  end
end
