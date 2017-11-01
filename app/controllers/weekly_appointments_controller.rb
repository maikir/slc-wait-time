class WeeklyAppointmentsController < ApplicationController
  def index
    redirect_to :controller => 'weekly_appointments',
                :action => 'create',
                :id => params[:id],
                :course => params[:course]
  end

  def create
    student = Student.find(params[:student_id])
    if student.weekly_appointment.nil?
      student.build_weekly_appointment(:course => params[:course])
      student.save
    else
      flash[:notice] = 'you have already signed up, please wait and a tutor will be with you shortly'
    end
    redirect_to :controller => 'student_queues',
                :action => 'create',
                :id => params[:id],
                :course => params[:course]
  end
end