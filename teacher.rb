require_relative 'person'

class Teacher < Person
  @teachers_list = []
  def initialize(specialization, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
    self.class.teachers_list << self
    Person.all_people << self
  end

  class << self
    attr_reader :teachers_list
  end

  def can_use_services?
    true
  end
end
