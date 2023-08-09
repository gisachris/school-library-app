require_relative 'rentals'
require_relative 'rental_behaviors'

class Book
  include RentalBehaviors
  attr_accessor :title, :author, :rentals_list

  @book_list = []

  def initialize(title, author)
    @title = title
    @author = author
    @rentals_list = []
    self.class.book_list << self
  end

  class << self
    attr_accessor :book_list
  end

  def to_h
    {
      title: @title,
      author: @author,
      rentals_list: rentals_list.map(&:to_h_without_related)
    }
  end

  def book_side_renting(date, person)
    ren = Rental.new(date, self, person)
    rentals_list << ren
  end

  # load and create instances of Book objects along with associated Rental object
  def self.load_books(data)
    @book_list = data.map do |book_data|
      title = book_data[:title]
      author = book_data[:author]
      book = Book.new(title, author)

      book_data[:rentals_list]&.each do |rental_data|
        date = rental_data[:date]
        person_data = rental_data[:person]
        person = Person.find_by_id(person_data[:id]) if person_data
        if person
          Rental.new(date, book, person)
        elsif person_data
          puts "Unable to find rental of book #{title} by #{author}."
        end
      end
      book
    end
  end
end
