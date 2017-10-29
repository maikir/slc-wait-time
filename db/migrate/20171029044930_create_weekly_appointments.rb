class CreateWeeklyAppointments < ActiveRecord::Migration
  def change
    create_table :weekly_appointments do |t|
      t.integer :student_id
      t.string :course

      t.timestamps null: false
    end
  end
end
