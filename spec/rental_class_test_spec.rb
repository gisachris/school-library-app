require_relative '../rentals'
require_relative '../books'
require_relative '../person'
require 'rspec'

describe Rental do
  context 'Running Tests On Rental Class And Its Methods' do
    let(:book) { Book.new('Test Book', 'Test Author') }
    let(:person) { Person.new(12, 'John Doe') }

    it 'Should Be Instansiated Correctly' do
      rental = Rental.new('2023-08-10', book, person)
      expect(rental).to be_an_instance_of Rental
    end

    it 'Should Be Added To All Rentals' do
      rental = Rental.new('2023-08-10', book, person)
      expect(Rental.all_rentals).to include(rental)
    end

    it 'Should Not Load Rentals Data When Book Not Found' do
      rental_data = [
        {
          date: '2023-08-10',
          book: {
            title: 'Nonexistent Book',
            author: 'Unknown Author'
          },
          person: {
            age: 12,
            name: 'John Doe'
          }
        }
      ]

      Book.new('Test Book', 'Test Author')

      Rental.load_rentals(rental_data)
      expect(Rental.all_rentals.size).to eq(0)
    end
  end
end
