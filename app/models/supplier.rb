class Supplier < ApplicationRecord
  #presence
  validates :brand_name, :corporate_name, :registration_number, :email, :phone, :full_address, presence: true  

  #uniqueness
  validates :registration_number, uniqueness: true

  #length
  validates :registration_number, length: {is:13}
  
  #format 
  validates :registration_number, format: {with:/[0-9]{13}/}
end
