require 'sinatra'
require 'pry'

get '/' do
  'Main Menu'
end

require_relative "contact"

class CRM

  def initialize
    Contact.create("Daniel", "Valle", "daniel.vallecl@gmail.com", "Admin")
    Contact.create("John", "Smith", "johnsmith@gmail.com", "User")
    Contact.create("Jane", "Doe", "janedoe@gmail.com", "User")
  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  end

  def print_main_menu #Prints instructions to the User#
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected) #Offers Options to the User#
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then exit
    end
  end

  def add_new_contact #Adds a new Contact#
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

   Contact.create(first_name, last_name, email, note)
   puts "You added #{first_name} #{last_name} to your contacts!"

  end

  def modify_existing_contact #Modifies Contacts#
    puts "Which ID do you want to change?"
    contact_to_change = gets.chomp.to_i
    my_contact = Contact.find(contact_to_change) #Finds the contact to change#
    puts "What would you like to modify?"
    puts "[1] First Name"
    puts "[2] Last Name"
    puts "[3] Email"
    puts "[4] Note"
    puts "[5] Exit"
    modify_input = gets.chomp.to_i
      case modify_input
        when 1 then
          puts "What is the new first name?"
          new_first_name = gets.chomp
          my_contact.update("first_name", new_first_name)
          puts "You have changed the name to #{new_first_name}!"
        when 2 then
          puts "What is the new last name?"
          new_last_name = gets.chomp
          my_contact.update("last_name", new_last_name)
          puts "You have changed the name to #{new_last_name}!"
        when 3 then
          puts "What is the new email?"
          new_email = gets.chomp
          my_contact.update("email", new_email)
          puts "You have changed the email to #{new_email}!"
        when 4 then
          puts "What's the note?"
          new_note = gets.chomp
          my_contact.update("note", new_note)
          puts "You have changed the note!"
        when 5 then exit
      end
  end

  def delete_contact
    puts "What contact would you like to delete? (Type in ID)"
    id = gets.chomp.to_i
    contact = Contact.find(id)
    contact.delete
  end

  # This method should accept as an argument an array of contacts
  # and display each contact in that array
  def display_contacts(contacts)
    contacts.each do |contact|
      puts "Name: #{contact.first_name} #{contact.last_name}, Email: #{contact.email}"
    end
  end
  # HINT: Make use of this method in the display_all_contacts and search_by_attribute methods to keep your code DRY

  def display_all_contacts
    display_contacts(Contact.all)
  end

  def search_by_attribute
    display_contacts
  end

crm = CRM.new
crm.main_menu
