require 'rails_helper'

RSpec.describe Warehouse, type: :model do
	describe "#valid?" do
		it "falso quando o nome já está em uso" do
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

		it "falso quando o código já está em uso" do
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

		it "falso quando cep possui letras" do
			# Arrange
			warehouse =Warehouse.create(name:"Salgado Filho", code:"POA", city: "Porto Alegre", area:20_000,
									 address:"Av. Severo Dullius, 90.010", cep:"parada-310", state:"RS",
									 description:"É o maior e mais movimentado galpão do Rio Grande do Sul")
			# Act
			result = warehouse.valid?
			# Assert
			expect(result).to eql false
		end

		it "falso quando cep tem mais de 9 caracteres" do
			# Arrange
			warehouse = Warehouse.create(name:"Salgado Filho", code:"POA", city: "Porto Alegre", area:20_000,
									 address:"Av. Severo Dullius, 90.010", cep:"902000-310", state:"RS",
									 description:"É o maior e mais movimentado galpão do Rio Grande do Sul")
			# Act
			result = warehouse.valid?
			# Assert
			expect(result).to eql false
		end


		it "falso quando cep tem menos de 9 caracteres" do
			# Arrange
			warehouse =Warehouse.create(name:"Salgado Filho", code:"POA", city: "Porto Alegre", area:20_000,
									 address:"Av. Severo Dullius, 90.010", cep:"0-310", state:"RS",
									 description:"É o maior e mais movimentado galpão do Rio Grande do Sul")
			# Act
			result = warehouse.valid?
			# Assert
			expect(result).to eql false
		end

		it "falso quando o tamanho é diferente de 2" do
			# Arrange
			warehouse =Warehouse.create(name:"Salgado Filho", code:"POA", city: "Porto Alegre", area:20_000,
									 address:"Av. Severo Dullius, 90.010", cep:"23450-310", state:"RSA",
									 description:"É o maior e mais movimentado galpão do Rio Grande do Sul")
			# Act
			result = warehouse.valid?
			# Assert
			expect(result).to eql false
		end


		it "falso quando Estado é minúsculo" do
			# Arrange
			warehouse =Warehouse.create(name:"Salgado Filho", code:"POA", city: "Porto Alegre", area:20_000,
									 address:"Av. Severo Dullius, 90.010", cep:"23450-310", state:"rs",
									 description:"É o maior e mais movimentado galpão do Rio Grande do Sul")
			# Act
			result = warehouse.valid?
			# Assert
			expect(result).to eql false
		end


		it "falso quando Estado é um número" do
			# Arrange
			warehouse =Warehouse.create(name:"Salgado Filho", code:"POA", city: "Porto Alegre", area:20_000,
									 address:"Av. Severo Dullius, 90.010", cep:"23450-310", state:"22",
									 description:"É o maior e mais movimentado galpão do Rio Grande do Sul")
			# Act
			result = warehouse.valid?
			# Assert
			expect(result).to eql false
		end

		it "falso quando o tamanho do código é diferente de 3" do
			# Arrange
			warehouse =Warehouse.create(name:"Salgado Filho", code:"POAW", city: "Porto Alegre", area:20_000,
									 address:"Av. Severo Dullius, 90.010", cep:"23450-310", state:"RS",
									 description:"É o maior e mais movimentado galpão do Rio Grande do Sul")
			# Act
			result = warehouse.valid?
			# Assert
			expect(result).to eql false
		end

		it "falso quando o código é um número" do
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
