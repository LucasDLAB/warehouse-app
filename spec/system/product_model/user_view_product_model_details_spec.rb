require "rails_helper"

describe "Usuário acessa a página de detalhes" do 
	it "a partir da tela inicial de modelos" do
		supplier = Supplier.create!(brand_name:"Sony", corporate_name:"Sony Group Corporation",
                               registration_number:"9278256900017", full_address:"Av das Palmas, 100",
                               email:"contato@sony.com", phone:"4003-2340")

		ProductModel.create!(name:"TV 75", weight:45, height:120,
                        width:21 , length:34 , sku:"GGTV-BBAQX-PURO-0623", supplier:supplier)

		visit root_path 
		click_on "Modelos de produto"
		click_on "TV 75"

		expect(page).to have_content "TV 75"
		expect(page).to have_content "45"
		expect(page).to have_content "120cm x 21cm x 34cm"
		expect(page).to have_content "GGTV-BBAQX-PURO-0623"
		expect(page).to have_content "Sony"
	end
end