require_relative './person.rb'
require_relative './book.rb'
require_relative './student.rb'
require_relative './teacher.rb'
require_relative './rental.rb'
require_relative './book.rb'
require_relative './classroom.rb'
require_relative './base_decorator.rb'
require_relative './capitalize_decorator.rb'
require_relative './trimmer_decorator.rb'
require_relative './nameable.rb'

class App
    attr_accessor :books, :people, :rentals

    def initialize
        @people = []
        @books = []
        @rentals = []
        @person = nil
        @book = nil
    end

    #book list
def book_list
    if @books.empty?
        puts 'No books found'
    else
        @books.each_with_index do |book, index|
            puts "Title: #{book.title}, Author: #{book.author}"
        end
    end
    
end

#list people
def people_list
    if @people.empty?
        puts 'No people found'
    else
        @people.each_with_index do |person, index|
            puts "[#{index}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
    end
end


#create new student
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
        @people << Student.new(age, classroom, name, parent_permission: true)
    when 'n'
        @people << Student.new(age, classroom, name, parent_permission: false)
    else
        puts 'Invalid input'
    end
    puts 'Student created successfully'
end

#create new teacher
def create_teacher
    puts 'Provide the details of the teacher'
    print 'Teacher Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    parent_permission = 'y'
    @people << Teacher.new(specialization, age,  name, parent_permission: true)
    puts 'Teacher created successfully'
end

#create person
def create_person
    print 'Do you want to create a student (1) or a teacher (2) [Input the number]:'
    person_type = gets.chomp
    if person_type ==  '1'
        create_student 
    elsif person_type == '2'
        create_teacher
    else
        puts 'Invalid option'
        return
    end
end

#create new book
def create_book
    puts 'Provide the details of the book'
    print 'Book Title: '
    title = gets.chomp
    print 'Book Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully'
end

#rental service
def create_rental
    if @books.length == 0 && @people.length == 0
        puts 'No books or no people found'
        return
    else 
        puts 'Select a book from the following list by number'
        @books.each_with_index do |book, index|
            puts "#{index + 1} - #{book.title} by #{book.author}"
        end
        index = gets.chomp. to_i 
        book_index = index - 1


        puts 'Select a person from the following list by number (not id)'
        @people.each_with_index do |people, index|
            puts "#{index + 1} - #{people.name} id: #{people.id} age: #{people.age}"
        end

        person_index = gets.chomp.to_i - 1

        person_rental = @people.select {|person| person.id == person_index}

        if person_rental
            puts 'Date:'
            date = gets.chomp. to_s
            @rentals << Rental.new(date, @books[book_index], @people[person_index])
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
    person = @people.find{|person| person.id == id}
    person.rentals.each do |rental|
        puts 'Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}'
    end
end
end



#exit method
def exit_app
    puts 'Thank you for using this app!'
    exit(true)
end

end