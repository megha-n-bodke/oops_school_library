require_relative '../rental'
require_relative '../person'
require_relative '../book'
describe Rental do
  let(:rental) { Rental.new('2022-11-25', Person.new('John Doe', 18), Book.new('The Hobbit', 'J.R.R. Tolkien')) }
  it 'Rental should be instance of Rental' do
    expect(rental).to be_instance_of(Rental)
  end
  it 'Rental date should be 2022-11-25' do
    expect(rental.date).to eq('2022-11-25')
  end
  it 'Rental should have a book' do
    expect(rental.book).to be_instance_of(Book)
  end
end
