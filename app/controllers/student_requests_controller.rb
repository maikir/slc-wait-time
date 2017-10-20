class StudentRequestsController < ApplicationController
	
  def wait_time
    @student_request = StudentRequest.find(params[:id])
	@wait_position = @student_request.wait_pos
	@wait_time = @wait_position * 30
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
