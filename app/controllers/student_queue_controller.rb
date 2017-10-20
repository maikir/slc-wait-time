class StudentQueueController < ApplicationController
    def index
        @queueentries = StudentQueue.order(created_at)
    end
end