require_relative 'nameable'
require_relative 'rentals'
require_relative 'rental_behaviors'

class Person < Nameable
  include RentalBehaviors
  attr_accessor :name, :age, :rentals_list
  attr_reader :id

  # Instance variable to store all instances of Person
  @all_people = []

  def initialize(age, name = 'unknown', parent_permission: true)
    super(name)
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals_list = []

    # Add the current instance to the all_people array
    self.class.all_people << self
  end

  # find a person by ID
  def self.find_by_id(id)
    all_people.find { |person| person.id == id }
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

  # Getter method for all_people array
  def self.all_people
    @all_people ||= []
  end

  def to_h
    {
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      rentals_list: rentals_list.map(&:to_h_without_related)
    }
  end

  # Load person data
  def self.load_people(data)
    @all_people = data.map do |person_data|
      id = person_data[:id]
      name = person_data[:name]
      age = person_data[:age]
      parent_permission = person_data[:parent_permission]
      person = Person.new(age, name, parent_permission: parent_permission)
      person.instance_variable_set(:@id, id)

      if person_data[:rentals_list]
        person_data[:rentals_list].each do |rental_data|
          date = rental_data[:date]
          book_data = rental_data[:book]
          book = Book.book_list.find { |b| b.title == book_data[:title] && b.author == book_data[:author] } if book_data
          if book
            Rental.new(date, book, person)
          else
            puts "Unable to find book #{book_data[:title]} by #{book_data[:author]} for rental by person #{name} (ID: #{id}). Skipping rental." if book_data
          end
        end
      end
      person
    end
  end

  private

  def of_age?
    @age > 18
  end
end
