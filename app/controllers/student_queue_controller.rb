class StudentQueueController < ApplicationController
    def student_queue
        @queueentries = StudentQueue.order('created_at')
        render "student_requests/student_queue"
    end
end