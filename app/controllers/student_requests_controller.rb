class StudentRequestsController < ApplicationController
	
	def wait_time
	  @student_request = StudentRequest.find(params[:id])
    end
    
	def new
	    # render new template	
	end
	
    def create
	    # place holder
    end
    
end
