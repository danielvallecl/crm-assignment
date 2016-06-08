class Contact
  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = [ ]
  @@id = 1000

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id

    @@id += 1

  end

  def self.all
    @@contacts
  end

  def self.find(id)
    @@contacts.each do |contact|
      if contact.id == id
        return contact
      end
    end
  end

  def self.find_by(first_name)
    @@contacts.each do |contact|
      if contact.first_name == first_name
      first_name
      end
    end
  end

  def self.delete_all #Deletes everything in the Array#
    @@contacts.clear
  end

  def update(attribute, value) # Update attributes of Contacts#
    if attribute == "first_name"
      @first_name = value
    elsif attribute == "last_name"
      @last_name = value
    elsif attribute == "email"
      @email = value
    elsif attribute == "note"
      @note = value
    end
    puts value
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def delete
    @@contacts.each do |contact|
      if contact == self
        contact.delete
      end
    end
  end

  # Store the newly created contact, and returns it#
  def self.create(first_name, last_name, email, note = "N/A")
    new_contact = new(first_name, last_name, email, note)
    @@contacts << new_contact

    #Return the Contact created#
    new_contact
  end

end #Contact class ends#

#Instantiating Objects#

Contact.create("Daniel", "Valle", "daniel.vallecl@gmail.com", "Admin")
Contact.create("John", "Smith", "johnsmith@gmail.com", "User")
Contact.create("Jane", "Doe", "janedoe@gmail.com", "User")

puts Contact.find_by("David").delete

puts Contact.delete_all

daniel = Contact.create("Daniel", "Valle", "daniel.vallecl@gmail.com", "Admin")

daniel.update("first_name", "Jack")

daniel.update("last_name", "Smith")
