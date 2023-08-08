require_relative 'nameable'
require_relative 'rentals'
require_relative 'rental_behaviors'

class Person < Nameable
  include RentalBehaviors
  attr_accessor :name, :age, :rentals_list
  attr_reader :id

  @all_people = []

  def initialize(age, name = 'unknown', parent_permission: true)
    super(name)
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals_list = []

    self.class.all_people << self
  end

  def correct_name()
    @name
  end

  def can_use_services?
    @age > 18 || @parent_permission
  end

  def person_side_renting(date, book)
    ren = Rental.new(date, book, self)
    rentals_list << ren
  end

  def self.all_people
    @all_people ||= []
  end

  private

  def of_age?
    @age > 18
  end
end
