require 'rails_helper'

RSpec.describe StudentRequestsController, type: :controller do
  describe 'wait time' do
      it 'retrieves the correct student request' do
          @fake_student_request = double('StudentRequest', :wait_pos => 5, :id => 2)
          allow(StudentRequest).to receive(:find).with(2).and_return(@fake_student_request)
          get
          expect(:student_request).to eq(@fake_student_request)
      end
  end
end
