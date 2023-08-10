require 'date'
require_relative '../person'

RSpec.describe Person do
  def create_sample_person(age: 20, parent_permission: true)
    Person.new(age, parent_permission: parent_permission)
  end

  describe '#initialize' do
    it 'creates a new Person instance with provided age and parent_permission' do
      person = create_sample_person(age: 15, parent_permission: true)
      expect(person.age).to eq(15)
      expect(person.can_use_services?).to be_truthy
    end
  end


  describe '#correct_name' do
    it 'returns the correct name of the person' do
      person = create_sample_person
      expect(person.correct_name).to eq(person.name)
    end
  end

  describe '#can_use_services?' do
    it 'returns true if age is over 18' do
      person = create_sample_person(age: 21)
      expect(person.can_use_services?).to be_truthy
    end

    it 'returns true if age is under 18 and parent_permission is true' do
      person = create_sample_person(age: 17, parent_permission: true)
      expect(person.can_use_services?).to be_truthy
    end

    it 'returns false if age is under 18 and parent_permission is false' do
      person = create_sample_person(age: 17, parent_permission: false)
      expect(person.can_use_services?).to be_falsey
    end
  end

  describe '#person_side_renting' do
    it "adds a rental to the person's rentals_list" do
      person = create_sample_person
      book = instance_double('Book')
      date = Date.new(2023, 8, 10)

      rental_double = instance_double('Rental', date: date, book: book, person: person)
      allow(Rental).to receive(:new).and_return(rental_double)

      person.person_side_renting(date, book)

      expect(person.rentals_list.length).to eq(1)
      expect(person.rentals_list[0]).to eq(rental_double)
    end
  end
end
