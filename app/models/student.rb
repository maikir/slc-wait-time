class Student < ActiveRecord::Base
    self.primary_key = :sid
    has_many :drop_in_histories
    has_one :student_queue
    has_one :active_session

  def destroy_student_queue
    if self.student_queue
      self.student_queue.destroy
      self.student_queue= nil
      self.save
    end
  end
end
