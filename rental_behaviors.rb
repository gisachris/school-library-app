module RentalBehaviors
  def book_side_renting(date, person)
    raise NotImplementedError, 'Subclasses must implement this method'
  end

  def person_side_renting(date, book)
    raise NotImplementedError, 'Subclasses must implement this method'
  end
end
