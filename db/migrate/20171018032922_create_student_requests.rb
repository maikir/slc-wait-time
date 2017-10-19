class CreateStudentRequests < ActiveRecord::Migration
  def change

    create_table :student_requests do |t|
      #entered by student, visible on tutor form
      t.integer :student_sid
      t.string :request_type
      t.string :course

      t.integer :tutor_sid
      t.time :start_time
      t.time :end_time
      t.text :notes
      #*** what will be the values of status? -- "no show", "late cancellation", "in progress", "finished", "scheduled"? ---> just "no show"?
      t.string :status

      t.timestamps null: false
    end
  end
end
