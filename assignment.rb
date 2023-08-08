module Assignment
  def classroom_assignment(assigned_classroom)
    @classroom = assigned_classroom
    assigned_classroom.students.push(self) unless assigned_classroom.students.include?(self)
  end

  def student_assignment(assigned_classroom, student)
    students << student
    student.classroom = assigned_classroom
  end
end
