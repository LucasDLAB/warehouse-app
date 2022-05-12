require "rails_helper"

describe "Usuário vê detalhes de um fornecedor" do
	it 'e vê informações adicionais' do 
	# Arrange
	Supplier.create!(brand_name:"Sony",corporate_name:"Sony Corporation Group",registration_number:"7894563116249",
    email:"sac@sony.com",phone:"2345-3232", full_address:"Av das Flores, 1001")
	#Act
	visit(root_path)
  click_on "Fornecedores"
	click_on("Sony")

	#Assert
	expect(page).to have_content("Sony")
	expect(page).to have_content("Sony Corporation Group")
	expect(page).to have_content("78.945.631/1624-9")
	expect(page).to have_content("sac@sony.com")
	expect(page).to have_content("2345-3232")
	expect(page).to have_content("Av das Flores, 1001")	
	end
end