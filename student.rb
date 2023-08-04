require_relative 'person'

class Student < Person
  @student_list = []
  def initialize(age, name = 'unknown', classroom = nil, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    classroom.students << self unless classroom.nil?
    self.class.student_list << self
    Person.all_people << self
  end

  class << self
    attr_reader :student_list
  end

  def play_hooky
    puts '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
