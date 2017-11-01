class ScheduledAppointmentsController < ApplicationController

  def index
	  @queue_entries = StudentQueue.order('created_at')
	  @queue_entries2 = WeeklyAppointment.order('created_at')
	  @queue_entries3 = ScheduledAppointment.order('created_at')
	  render "student_queues/index"
  end

  def create
    student = Student.find(params[:student_id])
    if student.scheduled_appointment.nil?
      student.build_scheduled_appointment(:course => params[:course])
      student.save
    else
      flash[:notice] = 'you have already checked in, please wait and a tutor will be with you shortly'
    end
  end
end