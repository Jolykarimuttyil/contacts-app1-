class Contact < ApplicationRecord
  def frinendly_created_at 
    created_at.strftime("%B %e, %y")
  end 
  def full_name 
    full_name = "#{first_name}  #{last_name}"
  end
  def japan_phone_number
    "+81 #{phone_number}"
  end
 
  def as_json
    {
      id: id,
      full_name: full_name,
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name,
      email_address: email_address,
      phone_number: phone_number,
      phone_number: japan_phone_number,
      created_at: frinendly_created_at  
    }
  end 
end
