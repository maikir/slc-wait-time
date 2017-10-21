require 'rails_helper'

RSpec.describe StudentQueuesController, type: :controller do
  before(:each) do
    @fake_student_request = double('StudentQueue', :id => 2, :waiting? => true)
    @fake_student_request2 = double('StudentQueue', :id => 3, :waiting? => true)
    #allow(StudentQueue).to receive(:where).and_return(@fake_student_request)
  end
  describe 'wait time' do
    subject { get 'wait_time', :id => @fake_student_request.id}
    it 'retrieves the students waiting in the queue' do
      @fake_results = [@fake_student_request, @fake_student_request2]
      allow(StudentQueue).to receive(:where).and_return(@fake_results)
      subject
      expect(assigns(:sorted_results)).to eq(@fake_results)
    end
    it 'finds the correct wait position' do
      @fake_results = [@fake_student_request, @fake_student_request2]
      allow(StudentQueue).to receive(:where).and_return(@fake_results)
      subject
      expect(assigns(:wait_pos)).to eq(1)
    end
    it 'calculates the correct wait time' do
      @fake_results = [@fake_student_request, @fake_student_request2]
      allow(StudentQueue).to receive(:where).and_return(@fake_results)
      subject
      expect(assigns(:wait_time)).to eq(30)
    end
  end
end
