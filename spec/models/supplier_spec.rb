require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe "#valid?" do
    it "falso quando CNPJ não único" do
      # Arrange
      first_supplier = Supplier.create(brand_name:"Sony",corporate_name:"Sony Corporation Group",registration_number:"7894563116249",
                                      email:"sac@sony.com",phone:"2345-3232", full_address:"Av das Flores, 1001")
      second_supplier = Supplier.create(brand_name:"Samsung",corporate_name:"Samsung Eletronics",registration_number:"7894563116249",
                                        email:"sac@samsung.com",phone:"3422-4233", full_address:"Rua do Porto, 220")
      
      # Act
      result = second_supplier.valid?
     
      # Assert
      expect(result).to eql false
    end

    it "falso quando o número de documentação possui mais de 13 caracteres" do
      # Arrange
      supplier = Supplier.create(brand_name:"Sony",corporate_name:"Sony Corporation Group",registration_number:"789456311624912",
                                email:"sac@sony.com",phone:"2345-3232", full_address:"Av das Flores, 1001")
      
      # Act
      result = supplier.valid?
      
      # Assert
      expect(result).to eql false
    end

    it "falso quando o número de documentação possui menos de 13 caracteres" do
      # Arrange
      supplier = Supplier.create(brand_name:"Sony",corporate_name:"Sony Corporation Group",registration_number:"7894563",
                                email:"sac@sony.com",phone:"2345-3232", full_address:"Av das Flores, 1001")
      
      # Act
      result = supplier.valid?
      
      # Assert
      expect(result).to eql false
    end

    it "falso quando o número de documentação possui letras" do
      supplier = Supplier.create(brand_name:"Sony",corporate_name:"Sony Corporation Group",registration_number:"abcdefghijklm",
                                email:"sac@sony.com",phone:"2345-3232", full_address:"Av das Flores, 1001")
      
      result = supplier.valid?

      expect(result).to eql false
    end
  end
end
