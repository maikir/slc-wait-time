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
  end
    
  def new
    # render new template	
  end
	
  def create
    # place holder
  end

  def confirm
    #wait in line
  end

  def leave
    #don't wait in line
    @student_request = StudentRequest.find(params[:id])
    
  end

end
