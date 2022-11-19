require_relative './app'
@functions = App.new

def menu
  puts 'Welcome to School Library App!!!!'
  puts "\n"

  puts 'Please choose an option by entering a number:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals  a given person id'
  puts '7. Exit'
  puts "\n"
end

def options
  gets.chomp.to_i
end

def input_match(num)
  case num
  when '1'
    puts 'option 1'
    @functions.book_list

  when '2'
    @functions.people_list
  when '3'
    @functions.create_person
  when '4'
    @functions.create_book
  when '5'
    @functions.create_rental
  when '6'
    @functions.list_rentals_by_person_id
  when '7'
    @functions.exit_app
  else
    puts 'Invalid Option: Please try again'
  end
end

def main(status)
  loop do
    break unless status

    menu
    user_input = options
    input_match(user_input)
  end
end

main(true)
