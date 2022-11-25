require_relative '../book'
require_relative '../rental'
require_relative '../person'

describe Book do

    before :each do
        @book = Book.new("The Hobbit", "J.R.R. Tolkien")
    end

    it "Book name should be The Hobbit" do
        expect(@book.title).to eq("The Hobbit")
    end

    it "Book author should be J.R.R. Tolkien" do
    expect(@book.author).to eq("J.R.R. Tolkien")
    end

    it "@book should be instance of Book" do
        expect(@book).to be_instance_of(Book)
    end

end

