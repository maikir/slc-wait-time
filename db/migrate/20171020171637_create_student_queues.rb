class CreateStudentQueues < ActiveRecord::Migration
  def change
    create_table :student_queues do |t|
      
      #entered by student, visible on tutor form
      
      t.integer :student_id #should be foreign key.
      t.string :course
      t.integer :tutor_sid #this should not be here. It should live in drop_in_histories.
      t.time :start_time

      #*** what will be the values of status? -- "in progress", "waiting" 
      t.boolean :waiting?
      t.timestamps  #sort by create time.
      
    end
  end
end
