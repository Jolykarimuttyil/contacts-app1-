require "unirest"

system "clear"


puts "Welcome to contacts app! Input an option please: "
puts "[1] show all contacts"
puts "[2] show one contacts"
puts "[3] create a new contact"

input_option = gets.chomp 
if input_option == "1"
  response = Unirest.get("http://localhost:3000/v1/contacts")
  contacts = response.body 
  puts JSON.pretty_generate(contacts)

 elsif input_option == "2"
   print "Enter a contact id: "
   contacts_id = gets.chomp
   response = Unirest.get("http://localhost:3000/v1/contacts/#{contacts_id}")
   contacts = response.body 
   puts JSON.pretty_generate(contacts)

 elsif input_option == "3"
  

     
   


end 