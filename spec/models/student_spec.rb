require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'If a student does not want to wait in line' do
    before :each do
      student_info = {:first_name => 'Haggai',
                      :last_name => 'Kaunda',
                      :sid => 123456,
                      :email => 'student@email.edu'}
      @student = FactoryGirl.build(:student, student_info)
      @student.build_student_queue(:course => 'Greek')
      @student.queue_to_history
    end
    it 'moves the student to the drop_in_history' do

      expect(@student.drop_in_histories).not_to be_empty
    end
    describe 'it sets drop_in_attribute accordingly' do
      before :each do
        @drop_in_history = @student.drop_in_histories[0]
      end
      it 'records what course the student wanted tutoring for.' do
        expect(@drop_in_history.course).to eq(@student.student_queue.course)
      end
      it 'indicates that the student canceled.' do
        expect(@drop_in_history.status).to eq('canceled')
      end
    end

  end
end
