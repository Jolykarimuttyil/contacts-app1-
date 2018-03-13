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
   print "first_name: "
   first_name = gets.chomp 
   print "last_name: "
   last_name = gets.chomp 
   print "email_address: "
   email_address = gets.chomp 
   print "phone_number: "
   phone_number = gets.chomp 

   params = {
    "input_first_name" => first_name,
    "input_last_name" => last_name,
    "input_email_address" => email_address,
    "input_phone_number" => phone_number
    
    }
    response = Unirest.post("http://localhost:3000/v1/contacts/#{contacts_id}", parameters: params)
    contacts = response.body 
    puts JSON.pretty_generate(contacts)
     
   


end 