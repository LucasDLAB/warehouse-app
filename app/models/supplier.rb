class Supplier < ApplicationRecord
  #presence
  validates :brand_name, :corporate_name, :registration_number, :email, :phone, :full_address, presence: true  

  #uniqueness
  validates :registration_number, uniqueness: true

  #length
  validates :registration_number, length: {is:13}
  
  after_validation :format_documentation
  
  private
    def format_documentation
      if self.registration_number.length == 13
        self.registration_number.insert(2, ".")
        self.registration_number.insert(6, ".")
        self.registration_number.insert(10, "/")
        self.registration_number.insert(15, "-")
      end
    end
end
