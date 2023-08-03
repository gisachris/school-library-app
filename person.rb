require_relative 'nameable'
require_relative 'rentals'

class Person < Nameable
  attr_accessor :name, :age, :rentals_list
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permission: true)
    super(name)
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals_list = []
  end

  def correct_name()
    @name
  end

  def can_use_services?
    @age > 18 || @parent_permission
  end

  def rent(date, book)
    ren = Rental.new(date, book, self)
    rentals_list << ren
  end

  private

  def of_age?
    @age > 18
  end
end
