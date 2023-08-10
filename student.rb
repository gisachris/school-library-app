require_relative 'person'
require_relative 'assignment'

class Student < Person
  attr_accessor :classroom

  @student_list = []
  def initialize(age, name = 'unknown', classroom = nil, parent_permission: true, label: 'Student')
    super(age, name, parent_permission: parent_permission, label: label)
    @classroom = classroom
    @label = label
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

  include Assignment
end
