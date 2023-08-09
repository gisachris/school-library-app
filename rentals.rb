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
      date = rental_data[:date]
      book_data = rental_data[:book]
      person_data = rental_data[:person]

      book = Book.book_list.find { |b| b.title == book_data[:title] && b.author == book_data[:author] } if book_data
      person = Person.find_by_id(person_data[:id]) if person_data

      if book
        Rental.new(date, book, person)
      else
        puts "Unable to find book #{book_data[:title]} by #{book_data[:author]}. Skipping rental." if book_data
        nil
      end
    end.compact
  end
end
