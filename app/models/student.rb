class Student < ActiveRecord::Base
    self.primary_key = :sid
    has_many :drop_in_histories
    has_one :student_queue
end
