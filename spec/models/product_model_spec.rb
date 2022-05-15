require 'rails_helper'

RSpec.describe ProductModel, type: :model do
	describe "#valid" do
		it "SKU deve ser único" do 
			supplier = Supplier.create!(brand_name:"Sony", corporate_name:"Sony Group Corporation",
	                               registration_number:"9278256900017", full_address:"Av das Palmas, 100",
	                               email:"contato@sony.com", phone:"4003-2340")

			pm = ProductModel.create(name:"TV 75", weight:45, height:120,
	                        width:21 , length:34 , sku:"GGTV-BBAQX-PURO-0623", supplier:supplier)

			another_pm = ProductModel.create(name:"TV 32", weight:35, height:80,
	                        width:15 , length:29 , sku:"GGTV-BBAQX-PURO-0623", supplier:supplier)

			result = another_pm.valid?
			
			expect(result).to eql false
		end

		it "SKU com tamanho menor que 20 caracteres" do
			supplier = Supplier.create!(brand_name:"Sony", corporate_name:"Sony Group Corporation",
	                               registration_number:"9278256900017", full_address:"Av das Palmas, 100",
	                               email:"contato@sony.com", phone:"4003-2340")

			pm = ProductModel.create(name:"TV 75", weight:45, height:120,
	                        width:21 , length:34 , sku:"GGTV-BBAQX-PURO-062", supplier:supplier)

			result = pm.valid?
			
			expect(result).to eql false
		end

		it "SKU com tamanho maior que 20 caracteres" do
			supplier = Supplier.create!(brand_name:"Sony", corporate_name:"Sony Group Corporation",
	                               registration_number:"9278256900017", full_address:"Av das Palmas, 100",
	                               email:"contato@sony.com", phone:"4003-2340")

			pm = ProductModel.create(name:"TV 75", weight:45, height:120,
	                        width:21 , length:34 , sku:"GGTV-BBAQX-PURO-06232", supplier:supplier)

			result = pm.valid?
			
			expect(result).to eql false
		end

		it "Peso deve ser maior que 0" do
			supplier = Supplier.create!(brand_name:"Sony", corporate_name:"Sony Group Corporation",
	                               registration_number:"9278256900017", full_address:"Av das Palmas, 100",
	                               email:"contato@sony.com", phone:"4003-2340")

			pm = ProductModel.create(name:"TV 75", weight:0, height:120,
	                        width:21 , length:34 , sku:"GGTV-BBAQX-PURO-0623", supplier:supplier)

			result = pm.valid?
			
			expect(result).to eql false
		end

		it "Altura deve ser maior que 0" do
			supplier = Supplier.create!(brand_name:"Sony", corporate_name:"Sony Group Corporation",
	                               registration_number:"9278256900017", full_address:"Av das Palmas, 100",
	                               email:"contato@sony.com", phone:"4003-2340")

			pm = ProductModel.create(name:"TV 75", weight:45, height:0,
	                        width:21 , length:34 , sku:"GGTV-BBAQX-PURO-0623", supplier:supplier)

			result = pm.valid?
			
			expect(result).to eql false
		end

		it "Peso deve ser maior que 0" do
			supplier = Supplier.create!(brand_name:"Sony", corporate_name:"Sony Group Corporation",
	                               registration_number:"9278256900017", full_address:"Av das Palmas, 100",
	                               email:"contato@sony.com", phone:"4003-2340")

			pm = ProductModel.create(name:"TV 75", weight:45, height:0,
	                        width:21 , length:34 , sku:"GGTV-BBAQX-PURO-0623", supplier:supplier)

			result = pm.valid?
			
			expect(result).to eql false
		end

		it "Largura deve ser maior que 0" do
			supplier = Supplier.create!(brand_name:"Sony", corporate_name:"Sony Group Corporation",
	                               registration_number:"9278256900017", full_address:"Av das Palmas, 100",
	                               email:"contato@sony.com", phone:"4003-2340")

			pm = ProductModel.create(name:"TV 75", weight:45, height:120,
	                        width:0 , length:34 , sku:"GGTV-BBAQX-PURO-0623", supplier:supplier)

			result = pm.valid?
			
			expect(result).to eql false
		end

		it "Comprimento deve ser maior que 0" do
			supplier = Supplier.create!(brand_name:"Sony", corporate_name:"Sony Group Corporation",
	                               registration_number:"9278256900017", full_address:"Av das Palmas, 100",
	                               email:"contato@sony.com", phone:"4003-2340")

			pm = ProductModel.create(name:"TV 75", weight:45, height:120,
	                        width:21 , length:0 , sku:"GGTV-BBAQX-PURO-0623", supplier:supplier)

			result = pm.valid?
			
			expect(result).to eql false
		end
	end
end
