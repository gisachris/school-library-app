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
    attr_reader :book_list
  end

  def book_side_renting(date, person)
    ren = Rental.new(date, self, person)
    rentals_list << ren
  end
end
