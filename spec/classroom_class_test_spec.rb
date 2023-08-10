require_relative '../classroom'
require_relative '../assignment'
require 'rspec'

describe Classroom do
  context "Running Tests On Classroom Class And Its Methods" do
    before(:each) do
      @classroom = Classroom.new('math')
    end

    it "Should Be An Instance Of The Classroom Class" do
      expect(@classroom).to be_an_instance_of Classroom
    end

    it "Should Store Students In Their Respective Assigned Classes" do
      #arrange
      student1 = double('student')
      student2 = double('student')

      # Stubbing for the student objects
      allow(student1).to receive(:name).and_return('bob')
      allow(student1).to receive(:age).and_return(12)
      allow(student1).to receive(:permission).and_return(true)
      allow(student1).to receive(:classroom=)  

      allow(student2).to receive(:name).and_return('mary')
      allow(student2).to receive(:age).and_return(18)
      allow(student2).to receive(:permission).and_return(true)
      allow(student2).to receive(:classroom=)  

      #act
      @classroom.student_assignment(@classroom, student1)
      @classroom.student_assignment(@classroom, student2)

      #assert
      expect(@classroom.students).to include student1
    end
  end
end
