require 'rspec'
require_relative '../books'
require_relative '../rentals'
require_relative '../rental_behaviors'
require_relative '../person'

RSpec.describe Book do
  let(:person) { instance_double(Person) }
  let(:book) { Book.new('Sample Book', 'Sample Author') }

  describe '#initialize' do
    it 'creates a new Book instance' do
      book = Book.new('Title', 'Author')
      expect(book).to be_instance_of(Book)
      expect(book.title).to eq('Title')
      expect(book.author).to eq('Author')
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the book' do
      book = Book.new('Title', 'Author')
      hash = book.to_h

      expect(hash[:title]).to eq('Title')
      expect(hash[:author]).to eq('Author')
      expect(hash[:rentals_list]).to eq([])
    end
  end

  describe '#book_side_renting' do
    it 'adds a rental to the rentals_list' do
      date = '2023-08-10'
      expect(Rental).to receive(:new).with(date, book, person)

      book.book_side_renting(date, person)

      expect(book.rentals_list.size).to eq(1)
    end
  end

  describe '.load_books' do
    let(:person_data) { { id: 1 } }
    let(:rental_data) { { date: '2023-08-10', person: person_data } }
    let(:book_data) { { title: 'Sample Book', author: 'Sample Author', rentals_list: [rental_data] } }
    let(:books_data) { [book_data] }

    context 'when person is found' do
      let(:person) { instance_double('Person', id: 1) }

      before do
        allow(Person).to receive(:find_by_id).with(1).and_return(person)
      end

      it 'creates books and rentals' do
        expect(Rental).to receive(:new).with('2023-08-10', instance_of(Book), person)

        Book.load_books(books_data)
      end
    end

    context 'when person is not found' do
      before do
        allow(Person).to receive(:find_by_id).with(1).and_return(nil)
      end

      it 'prints an error message' do
        expect { Book.load_books(books_data) }.to output(/Unable to find rental of book/).to_stdout
      end
    end
  end
end
