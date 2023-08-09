require_relative 'app'
require_relative 'store'
require_relative 'person'
require_relative 'books'
require_relative 'rentals'

module InputHandler
  def self.get_integer_input(prompt)
    print "#{prompt}:"
    gets.chomp.to_i
  end

  def self.get_string_input(prompt)
    print "#{prompt}:"
    gets.chomp.to_s
  end

  def self.get_boolean_input(prompt)
    print "#{prompt}:"
    answer = gets.chomp.downcase
    answer == 'y'
  end
end

module StartupMessage
  def self.print_once
    return if @printed

    puts 'Welcome to the School library app!'
    puts
    puts
    @printed = true
  end
end

def load_data_from_storage
  storage = StorageProcedures.new
  data = storage.read_from_storage

  # Load people, books, and rentals
  Person.load_people(data[2])
  Book.load_books(data[1])
  Rental.load_rentals(data[0])

  # Link rentals with people and books after loading.
  Rental.all_rentals.each do |rental|
    book = Book.book_list.find { |b| b.title == rental.book.title && b.author == rental.book.author }
    person = Person.all_people.find { |p| p.id == rental.person.id }

    rental.book = book if book
    rental.person = person if person
  end
end

def main
  StartupMessage.print_once
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a Rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

load_data_from_storage

loop do
  main
  choice = gets.chomp.to_i

  case choice
  when 1
    list_all_books
  when 2
    list_all_people
  when 3
    create_person
  when 4
    create_book
  when 5
    create_rental
  when 6
    list_rentals_by_id
  when 7
    puts 'Storing all data please wait..!'
    data = [Rental.all_rentals, Book.book_list, Person.all_people]
    storage = StorageProcedures.new
    storage.write_to_storage(data)

    puts 'Goodbye!'
    break
  else
    puts 'Your option was not valid!. Try again:'
  end
end
