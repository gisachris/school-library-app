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
      date: @date
    }
  end
end
