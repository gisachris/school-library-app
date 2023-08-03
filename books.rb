require_relative 'rentals'
class Book
  attr_accessor :title, :author, :rentals_list

  def initialize(title, author)
    @title = title
    @author = author
    @rentals_list = []
  end

  def rent(date, person)
    ren = Rental.new(date, self, person)
    rentals_list << ren
  end
end
