class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    book.rentals_list << self
    person.rentals_list << self

    self.class.add_to_all_rentals(self)
  end

  def self.all_rentals
    @all_rentals ||= []
  end

  def self.add_to_all_rentals(rental)
    all_rentals << rental
  end

  def to_h_without_related
    {
      date: @date,
      book: {
        title: @book.title,
        author: @book.author
      },
      person: {
        id: @person.id
      }
    }
  end

  def self.load_rentals(data)
    @all_rentals = data.map do |rental_data|
      load_rental(rental_data)
    end.compact
  end

  def self.load_rental(rental_data)
    date = rental_data[:date]
    book_data = rental_data[:book]
    person_data = rental_data[:person]

    book = find_book(book_data)
    person = find_person(person_data)

    create_rental(date, book, person, book_data) if book
  end

  def self.find_book(book_data)
    return unless book_data

    Book.book_list.find do |book|
      book.title == book_data[:title] && book.author == book_data[:author]
    end
  end

  def self.find_person(person_data)
    return unless person_data

    Person.find_by_id(person_data[:id])
  end

  def self.create_rental(date, book, person, book_data)
    Rental.new(date, book, person)
  rescue StandardError
    puts "Unable to find book #{book_data[:title]} by #{book_data[:author]}. Skipping rental."
    nil
  end
end
