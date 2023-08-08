require_relative 'rentals'

class Renting
    attr_reader :date, :book, :person
    def initialize(date,book,person)
        @date = date
        @book = book
        @person = person
    end

    def create_rental
        ren = Rental.new(date, book, person)
        book.rentals_list << ren
        person.rentals_list << ren
        Rental.all_rentals << ren
    end
end