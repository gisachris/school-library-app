require_relative 'app'

module StartupMessage
  def self.print_once
    return if @printed

    puts 'Welcome to the School library app!'
    puts
    puts
    @printed = true
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
    puts 'Goodbye!'
    break
  else
    puts 'Your option was not valid!. Try again:'
  end
end
