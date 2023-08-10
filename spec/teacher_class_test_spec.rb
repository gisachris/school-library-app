require_relative '../teacher'
require 'rspec'

describe Teacher do
    context "Running Tests On Teacher Class And Its Methods" do
        before(:each) do
            @teacher = Teacher.new('Doctor', 45, 'ben Simmons')
        end

        it "Should initialise a teacher instance properly" do
            expect(@teacher).to be_an_instance_of Teacher
        end

        it "should inherit from Person class" do
            expect(Teacher.superclass).to eq(Person)
        end   
        
        it "should add a new teacher to the teachers_list when created" do
            new_teacher = Teacher.new('Math', 35, 'Alice')
            expect(Teacher.teachers_list).to include(new_teacher)
        end          

        it "#can_use_services should return true for teachers" do
            teacher_service_eligibility = @teacher.can_use_services?
            expect(teacher_service_eligibility).to be true
        end

        it "should default to 'unknown' name if not provided" do
            teacher = Teacher.new('Physics', 40)
            expect(teacher.name).to eq('unknown')
        end  
    end
end