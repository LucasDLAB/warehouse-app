require 'rails_helper'

RSpec.describe Warehouse, type: :model do
	describe "#valid?" do
		it "false when name is already in use" do
			# Arrange
			first_warehouse =Warehouse.create(name:"Salgado Filho", code:"POA", city: "Porto Alegre", area:20_000,
									 address:"Av. Severo Dullius, 90.010", cep:"90200-310", state:"RS",
									 description:"É o maior e mais movimentado galpão do Rio Grande do Sul")
			second_warehouse = Warehouse.create(name:"Salgado Filho", code:"SDU",city:"Rio de Janeiro",area:60_000,state:"RJ",
											address:"Rua Alameda",cep:"23213-330",description:"Aeroporto de carga")
			# Act
			result = second_warehouse.valid?
			# Assert
			expect(result).to eql false
		end

		it "false when code is already in use" do
			# Arrange
			first_warehouse =Warehouse.create(name:"Salgado Filho", code:"POA", city: "Porto Alegre", area:20_000,
									 address:"Av. Severo Dullius, 90.010", cep:"90200-310", state:"RS",
									 description:"É o maior e mais movimentado galpão do Rio Grande do Sul")
			second_warehouse = Warehouse.create(name:"Rio", code:"POA",city:"Rio de Janeiro",area:60_000,state:"RJ",
											address:"Rua Alameda",cep:"23213-330",description:"Aeroporto de carga")
			# Act
			result = second_warehouse.valid?
			# Assert
			expect(result).to eql false
		end

		it "false when cep has strings" do
			# Arrange
			warehouse =Warehouse.create(name:"Salgado Filho", code:"POA", city: "Porto Alegre", area:20_000,
									 address:"Av. Severo Dullius, 90.010", cep:"parada-310", state:"RS",
									 description:"É o maior e mais movimentado galpão do Rio Grande do Sul")
			# Act
			result = warehouse.valid?
			# Assert
			expect(result).to eql false
		end

		it "false when cep with more than 9 chars" do
			# Arrange
			warehouse = Warehouse.create(name:"Salgado Filho", code:"POA", city: "Porto Alegre", area:20_000,
									 address:"Av. Severo Dullius, 90.010", cep:"902000-310", state:"RS",
									 description:"É o maior e mais movimentado galpão do Rio Grande do Sul")
			# Act
			result = warehouse.valid?
			# Assert
			expect(result).to eql false
		end


		it "false when cep with less than 9 chars" do
			# Arrange
			warehouse =Warehouse.create(name:"Salgado Filho", code:"POA", city: "Porto Alegre", area:20_000,
									 address:"Av. Severo Dullius, 90.010", cep:"0-310", state:"RS",
									 description:"É o maior e mais movimentado galpão do Rio Grande do Sul")
			# Act
			result = warehouse.valid?
			# Assert
			expect(result).to eql false
		end

		it "false when length of state is different of 2" do
			# Arrange
			warehouse =Warehouse.create(name:"Salgado Filho", code:"POA", city: "Porto Alegre", area:20_000,
									 address:"Av. Severo Dullius, 90.010", cep:"23450-310", state:"RSA",
									 description:"É o maior e mais movimentado galpão do Rio Grande do Sul")
			# Act
			result = warehouse.valid?
			# Assert
			expect(result).to eql false
		end


		it "false when state is in lowercase" do
			# Arrange
			warehouse =Warehouse.create(name:"Salgado Filho", code:"POA", city: "Porto Alegre", area:20_000,
									 address:"Av. Severo Dullius, 90.010", cep:"23450-310", state:"rs",
									 description:"É o maior e mais movimentado galpão do Rio Grande do Sul")
			# Act
			result = warehouse.valid?
			# Assert
			expect(result).to eql false
		end


		it "false when state is a number" do
			# Arrange
			warehouse =Warehouse.create(name:"Salgado Filho", code:"POA", city: "Porto Alegre", area:20_000,
									 address:"Av. Severo Dullius, 90.010", cep:"23450-310", state:"22",
									 description:"É o maior e mais movimentado galpão do Rio Grande do Sul")
			# Act
			result = warehouse.valid?
			# Assert
			expect(result).to eql false
		end

		it "false when length of the code is different of 3" do
			# Arrange
			warehouse =Warehouse.create(name:"Salgado Filho", code:"POAW", city: "Porto Alegre", area:20_000,
									 address:"Av. Severo Dullius, 90.010", cep:"23450-310", state:"RS",
									 description:"É o maior e mais movimentado galpão do Rio Grande do Sul")
			# Act
			result = warehouse.valid?
			# Assert
			expect(result).to eql false
		end

		it "false when code is a number" do
			# Arrange
			warehouse =Warehouse.create(name:"Salgado Filho", code:"233", city: "Porto Alegre", area:20_000,
									 address:"Av. Severo Dullius, 90.010", cep:"23450-310", state:"RS",
									 description:"É o maior e mais movimentado galpão do Rio Grande do Sul")
			# Act
			result = warehouse.valid?
			# Assert
			expect(result).to eql false
		end

		
	end
end
