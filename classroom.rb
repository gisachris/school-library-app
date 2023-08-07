require_relative 'assignment'

class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  include Assignment
  # def add_student(student)
  #   students << student
  #   student.classroom = self
  # end
end
