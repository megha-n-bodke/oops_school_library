require_relative './person'
require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './classroom'
require_relative './base_decorator'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'
require_relative './nameable'
require_relative './data_store'
require 'pry'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []

    @people_store = DataStore.new('people')
    @people = @people_store.read.map do |person|
      if person['type'] == 'Student'
        Student.new(person['classroom'], person['age'], person['name'], parent_permission: person['parent_permission'])
      else

        Teacher.new(person['specialization'], person['age'], person['name'],
                    parent_permission: person['parent_permission'])
      end
    end

    @books_store = DataStore.new('books')
    @books = @books_store.read.map do |book|
      Book.new(book['title'], book['author'])
    end
    p @books
    @rentals_store = DataStore.new('rentals')
    @rentals = @rentals_store.read.map do |rental|
      Rental.new(rental['date'], @books[0], @people[0])
    end
  end

  # book list
  def book_list
    if @books.empty?
      puts 'No books found'
    else
      @books.each_with_index do |book, _index|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  # list people
  def people_list
    if @people.empty?
      puts 'No people found'
    else
      @people.each_with_index do |person, index|
        puts "[#{index}] [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  # create new student
  def create_student
    puts 'Provide the details of the student'
    print 'Student Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp

    print 'Student classroom: '
    classroom = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp

    case parent_permission
    when 'y'
      @people << Student.new(classroom, age, name, parent_permission: true)
    when 'n'
      @people << Student.new(classroom, age, name, parent_permission: false)
    else
      puts 'Invalid input'
    end
    puts 'Student created successfully'
  end

  # create new teacher
  def create_teacher
    puts 'Provide the details of the teacher'
    print 'Teacher Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people << Teacher.new(specialization, age, name, parent_permission: true)
    puts 'Teacher created successfully'
  end

  # create person
  def create_person
    print 'Do you want to create a student (1) or a teacher (2) [Input the number]:'
    person_type = gets.chomp
    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid option'
      nil
    end
  end

  # create new book
  def create_book
    puts 'Provide the details of the book'
    print 'Book Title: '
    title = gets.chomp
    print 'Book Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  # rental service
  def create_rental
    if @books.length.zero? && @people.length.zero?
      puts 'No books or no people found'
      nil
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index do |book, index|
        puts "#{index + 1} - #{book.title} by #{book.author}"
      end
      user_index = gets.chomp.to_i
      book_index = user_index - 1

      puts 'Select a person from the following list by id'
      @people.each_with_index do |people, index|
        puts "#{index + 1} - #{people.name} id: #{people.id} age: #{people.age}"
      end

      person_index = gets.chomp.to_i

      person_rental = @people.select { |person| person.id == person_index }.first

      if person_rental
        puts 'Date:'
        date = gets.chomp.to_s
        @rentals << Rental.new(date, person_rental, @books[book_index])
        puts 'Rental created successfully'
      else
        puts 'Invalid person ID'
      end
    end
  end

  def list_rentals_by_person_id
    puts 'Rentals:'
    if @rentals.empty?
      puts 'No rentals found'
    else
      print 'Enter the ID of the person: '
      id = gets.chomp.to_i
      person_id = @people.find { |person| person.id == id }
      person_id.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    end
  end

  # exit method
  def exit_app
    puts 'Thank you for using this app!'
    exit(true)
  end

  def input_match(num)
    case num
    when '1'
      puts 'option 1'
      book_list

    when '2'
      people_list
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals_by_person_id

    else
      puts 'Invalid Option: Please try again'
    end
  end

  def close
    @people_store.write(@people.map(&:create_json))
    @books_store.write(@books.map(&:create_json))
    @rentals_store.write(@rentals.map(&:create_json))
  end

  def run
    loop do
      menu
      option = gets.chomp
      if option == '7'
        puts 'Thank you for using this app!'
        close
        break
      end
      input_match(option)
    end
  end
end
