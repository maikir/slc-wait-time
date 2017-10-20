class CreateStudentQueues < ActiveRecord::Migration
  def change
    create_table :student_queues do |t|

      t.timestamps null: false
    end
  end
end
