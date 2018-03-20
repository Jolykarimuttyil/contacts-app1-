require "unirest"

system "clear"
puts "Welcome to contacts app! Input an option please: "
puts "[signup] signup (create a new user)"
puts "[login] login (login as user)"
puts "[signout] signout (signout from user)"

input_option = gets.chomp
if input_option == "signup"
  params = {}
  print "enter name: "
  params["name"] = gets.chomp
  print "enter a email: "
  params["email"] = gets.chomp
  print "enter a password: "
  params["password"] = gets.chomp
  print "password_conformation: "
  params["password_conformation"] = gets.chomp

  response = Unirest.post("http://localhost:3000/v1/users", parameters: params)
  p response.body  
 
 elsif  input_option == "login"
   print "enter email: "
   email = gets.chomp
   print "enter password: "
   password = gets.chomp
   response = Unirest.post(
    "http://localhost:3000/user_token",

    parameters: {
      auth: {
        email: email,
        password: password
      }
    }
  )
  jwt = response.body["jwt"]
  Unirest.default_header("Authorization", "Bearer #{jwt}")

elsif input_option == "logout"
 jwt = ""
Unirest.clear_default_headers()
end 


system "clear"
puts "Welcome to contacts app! Input an option please: "
puts "#{jwt}"
puts "[1] show all contacts"
puts " [1.1] search by first name"
puts "[2] show one contacts"
puts "[3] create a new contact"

input_option = gets.chomp 
if input_option == "1"
  response = Unirest.get("http://localhost:3000/v1/contacts")
  contacts = response.body 
  puts JSON.pretty_generate(contacts)
  input_option = gets.chomp 

elsif input_option == "1.1"
  print = "Enter a First name: "
  x = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/contacts?q=#{x}")
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
