require 'rails_helper'
require 'byebug'

RSpec.describe StudentQueuesController, type: :controller do
  describe 'wait time' do
    before(:each) do
      @fake_student_request = double('StudentQueue', :id => 2, :waiting? => true)
      @fake_student_request2 = double('StudentQueue', :id => 3, :waiting? => true)
      #allow(StudentQueue).to receive(:where).and_return(@fake_student_request)
    end
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

  describe 'enter line' do
    before :each do
      @params = {:student_first_name => 'Athina',
                 :student_last_name => 'Kaunda',
                 :student_sid => '23636173',
                 :student_course => 'math',
                 :student_email => 'student@email.com'}
    end
    it 'checks the Student model if the student exists.' do
      expect(Student).to receive(:where).with(:id => @params[:student_sid]).and_return([])
      post :create, @params
    end
    describe 'after the student signs up' do
      before :each do
        @student_data = {:first_name => @params[:student_first_name],
                         :last_name => @params[:student_last_name],
                         :sid => @params[:student_sid],
                         :email => @params[:student_email]}
        @student = FactoryGirl.build(:student, @student_data)
      end
      it 'creates the student if the student does not exists in the database' do
        allow(Student).to receive(:where).with(:id => @params[:student_sid]).and_return([])
        expect(Student).to receive(:create).with(@student_data).and_return(@student)
        post :create, @params
      end
      it 'adds the student to the queue' do
        post :create, @params
        expect(@student.student_queue).to_not be_nil
        expect(@student.student_queue.course).to eq(@params[:student_course])
        expect(StudentQueue.find(@student.sid).student).to eq(@student)
      end
    end

    describe 'if the student does not want to wait' do
      it 'removes the student from the queue'

      it 'writes the student to the drop in histroy'
      it 'records that the student cancelled.'
    end
  end
end
