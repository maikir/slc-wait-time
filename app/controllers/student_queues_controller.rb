class StudentQueuesController < ApplicationController
	def index
	  @queueentries = StudentQueue.order('created_at')
    render "student_queues/index"
  end

  def wait_time
    #byebug
    @sorted_results = StudentQueue.where(waiting?: true).sort_by {|request| request.id}
    @wait_pos = 0
    @sorted_results.each do |request|
      @wait_pos += 1
      break if "#{request.id}" == params[:id]
    end
	  @wait_time = @wait_pos * 30
	  
	  #will need the student's id in when confirming, so we pass it around
	  @student = Student.where(:sid => params[:id]) 
  end
    
  def new
    # render new template	
  end
	
  def create
    @sid = params[:student_sid]
    course = params[:student_course]
    if (Student.where(:id => @sid).empty?)
      first_name = params[:student_first_name]
      last_name = params[:student_last_name]
      email = params[:student_email]


      @student = Student.create(:first_name => first_name,
                                :last_name => last_name, 
                                :sid => @sid,
                                :email => email)
    end
    @student.build_student_queue(:course => course)
    @student.save

    redirect_to wait_time_student_queue_path(@student)
  end

  def confirm
    #wait in line
  end

  def destroy
    #send student here if they decide to not to stay in line.
  end

  def leave
    #don't wait in line
    @student_request = StudentRequest.find(params[:id])
    
  end

end
