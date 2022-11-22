require_relative './app'

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

def main
  app = App.new
  app.run
end

main
