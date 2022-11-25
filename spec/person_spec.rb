require_relative '../person'
require_relative '../rental'

describe Person do
  before :each do
    @person = Person.new(20, 'John')
  end

  it 'Person name should be John' do
    expect(@person.name).to eq('John')
  end

  it 'Person can use services' do
    expect(@person.can_use_services?).to be true
  end

  it 'Person can have a rental' do
    expect { @person.add_rental(Rental.new('2020-01-01', '2020-01-02', @person)) }
  end
end
