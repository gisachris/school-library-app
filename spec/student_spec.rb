require_relative '../student'
require_relative '../classroom'

describe Student do
  let(:classroom) { Classroom.new('101') }
  let(:student) { Student.new(16, 'John Doe', classroom) }

  describe '#initialize' do
    it 'creates a student with given attributes' do
      expect(student.age).to eq(16)
      expect(student.name).to eq('John Doe')
      expect(student.classroom).to eq(classroom)
    end

    it 'adds the student to classroom and student list' do
      expect(classroom.students).to include(student)
      expect(Student.student_list).to include(student)
    end
  end

  describe '#play_hooky' do
    it 'prints the play hooky message' do
      expect { student.play_hooky }.to output("¯\\(ツ)/¯\n").to_stdout
    end
  end
end
