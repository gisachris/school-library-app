require_relative 'rentals'
class Book
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

  def rent(date, person)
    ren = Rental.new(date, self, person)
    rentals_list << ren
  end
end
