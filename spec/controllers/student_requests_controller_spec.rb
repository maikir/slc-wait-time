require 'rails_helper'

RSpec.describe StudentRequestsController, type: :controller do
  before(:each) do
    @fake_student_request = double('StudentRequest', :wait_pos => 5, :id => 2)
    allow(StudentRequest).to receive(:find).with("2").and_return(@fake_student_request)
  end
  describe 'wait time' do
    subject { get 'wait_time', :id => @fake_student_request.id}
    it 'retrieves the correct student request' do
      subject
      expect(assigns(:student_request)).to eq(@fake_student_request)
    end
    it 'retrieves the requests wait position' do
      subject
      expect(assigns(:wait_position)).to eq(@fake_student_request.wait_pos)
    end
    it 'calculates wait time' do
      subject
      @wait_time = @fake_student_request.wait_pos * 30
      expect(assigns(:wait_time)).to eq(@wait_time)
    end
    
  end
end
