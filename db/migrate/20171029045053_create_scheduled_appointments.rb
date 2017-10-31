class CreateScheduledAppointments < ActiveRecord::Migration
  def change
    create_table :scheduled_appointments do |t|
      t.integer :student_id
      t.string :course

      t.timestamps null: false
    end
  end
end
