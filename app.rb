require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'books'
require_relative 'rentals'

def list_all_books
  all_books = Book.book_list
  i = 0
  puts 'No book Entries in Stock yet' if all_books.empty?
  all_books.each do |book|
    puts "#{i}) Title: #{book.title}, Author: #{book.author}"
    i += 1
  end
end

def list_all_people
  all_people = Person.all_people
  puts 'No Participant Entries made Yet.' if all_people.empty?
  i = 0
  all_people.each do |person|
    puts "#{i}) [#{person.label}] Name:#{person.name}, ID:#{person.id}, Age:#{person.age}"
    i += 1
  end
end

def create_person
  print 'Do you want to create a student(1) or a teacher(2) [input the number]:'
  p_choice = InputHandler.plain_integer_input
  case p_choice
  when 1
    create_student
    puts 'Person entry created successfully!'
  when 2
    create_teacher
    puts 'Person entry created successfully!'
  else
    puts 'wrong choice'
  end
end

def create_book
  book_name = InputHandler.get_string_input('Title')

  book_author = InputHandler.get_string_input('Author')

  Book.new(book_name, book_author)
  puts 'Book created succesfully!'
end

def create_rental
  puts 'select a book from the following list by number: '
  list_all_books
  inputed_book = InputHandler.plain_integer_input
  selected_book = Book.book_list[inputed_book]

  puts 'select a person from the following list by number(not id): '
  list_all_people
  inputed_person = InputHandler.plain_integer_input
  selected_person = Person.all_people[inputed_person]

  rent_date = InputHandler.get_string_input('Date')

  Rental.new(rent_date, selected_book, selected_person)
  puts 'Rental created successfully!'
end

def list_rentals_by_id
  print 'ID of person: '
  person_id = gets.chomp.to_i

  matching_rentals = Rental.all_rentals.select { |rental| rental.person.id == person_id }

  if matching_rentals.empty?
    puts 'No rentals found for that ID!'
  else
    puts 'Rentals: '
    matching_rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end
end

private

def create_student
  student_age = InputHandler.get_integer_input('Age')

  student_name = InputHandler.get_string_input('Name')

  student_permission = InputHandler.get_boolean_input('Has parent permission [Y/N]')

  Student.new(student_age, student_name, parent_permission: student_permission)
end

def create_teacher
  teacher_age = InputHandler.get_integer_input('Age')

  teacher_name = InputHandler.get_string_input('Name')

  teacher_specialization = InputHandler.get_string_input('specialization')

  Teacher.new(teacher_specialization, teacher_age, teacher_name)
end
