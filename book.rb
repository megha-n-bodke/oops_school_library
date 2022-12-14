class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(person, date, self)
  end

  def create_json
    {
      title: @title,
      author: @author
    }
  end
end
