class CreateDropInHistories < ActiveRecord::Migration
  def change
    create_table :drop_in_histories do |t|

      t.integer :student_id #should be foreign key from 
      t.string :course
      t.integer :tutor_sid
      t.time :start_time
      t.time :end_time #endtime => create time since students are added to the histroy after being seen.
      t.string :tutor_notes

      #***waiting?= true is for students still waiting to be seen. and waiting? = false for students currently being seen by a tutor.
      t.boolean :waiting?
      t.timestamps  #sort by create time.
    end
  end
end
