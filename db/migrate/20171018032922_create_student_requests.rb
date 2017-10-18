class CreateStudentRequests < ActiveRecord::Migration
  def change
    create_table :student_requests do |t|
      #entered by student, visible on tutor form
      t.string :last_name
      t.string :first_name
      t.string :sid
      t.string :request_type
      t.string :course

      #can't be seen on tutor form, but entered by student
      t.string :residency_status
      t.boolean :transfer_student
      t.boolean :concurrency_student

      #tutor entered stuff
      t.string :tutor
      t.time :start_time
      t.time :end_time
      t.text :notes
      #*** what will be the values of status? -- "no show", "late cancellation", "in progress", "finished", "scheduled"? ---> just "no show"?
      t.string :status

      t.timestamps null: false
    end
  end
end
