# Owners: hkaunda,

require 'rails_helper'

RSpec.describe ScheduledAppointmentsController, type: :controller do
  describe 'create' do
    before :each do
      @params = {:student_id => '2983457', :course => 'math'}
      @student = FactoryGirl.build(:student, :sid => @params[:student_id])
    end
    it 'looks up the student in the database' do
      expect(Student).to receive(:find).with(@params[:student_id]).and_return(@student)
      post :create, @params
    end
    it 'checks that a weekly appointment exists before creating one' do
      allow(Student).to receive(:find).with(@params[:student_id]).and_return(@student)
      expect(@student).to receive(:scheduled_appointment)
      post :create, @params
    end
    describe 'if student has not already signed in' do
      before :each do
        allow(Student).to receive(:find).with(@params[:student_id]).and_return(@student)
        allow(@student).to receive(:scheduled_appointment).and_return(nil)
      end
      it 'creates a weekly appointment for student and saves it' do
        expect(@student).to receive(:build_scheduled_appointment).with(:course => @params[:course])
        expect(@student).to receive(:save)
        post :create, @params
      end
    end
  end
end
