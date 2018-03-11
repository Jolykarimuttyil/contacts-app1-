class V1::ContactsController < ApplicationController
  def index
    contacts = Contact.all 
    render json: contacts.as_json
  end 
  def show 
    contacts = Contact.find_by(id: params["id"])
    render json: contacts.as_json
  end 
  
end
