class V1::ContactsController < ApplicationController
  def index
    contacts = Contact.all 
    render json: contacts.as_json
  end 
  def show 
    contacts = Contact.find_by(id: params["id"])
    render json: contacts.as_json
  end 
  def create 
    contacts = Contact.new(
      first_name: params["input_first_name"],
      last_name: params["input_last_name"],
      email_address: params["input_email_address"],
      phone_number: params["input_phone_number"]
         )
    contacts.save 
    render Json: contact.as_json

  end 
end
