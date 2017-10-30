class StudentsController < ApplicationController
  def new
    #render new template
  end

  def create
    sid = params[:student_sid]
    if Student.where(:sid => sid).empty?
      @student = Student.create(:first_name => params[:student_first_name],
                               :last_name => params[:student_last_name],
                               :sid => sid,
                               :email => params[:student_email])
    else
      @student = Student.find(sid)
    end

    redirect_to sign_up_student_path(:id => @student.id, :appointment_type => params[:appointment_type])
  end

  def sign_up
    appointment_type = params[:appointment_type]
    id, action = params[:id], 'create'
    case appointment_type
      when 'drop_in'
        redirect_to :controller => 'student_queues', :action => action, :id => id
      when 'scheduled'
        redirect_to :controller => 'scheduled_appointment', :action => action, :id => id
      when 'weekly'
        redirect_to :controller => 'weekly_appointments', :action => action, :id => id
    end
    #direct the request based on what type of appointment the student is here for.
  end

end