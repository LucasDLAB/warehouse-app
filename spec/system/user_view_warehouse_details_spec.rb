require "rails_helper"

describe "Usuário vê detalhes de um galpão" do
	it 'e vê informações adicionais' do 
	# Arrange
	Warehouse.create(name:"Salgado Filho", code:"POA", city: "Porto Alegre", area:20_000,
									 address:"Av. Severo Dullius, 90.010", cep:"90200-310", state:"RS",
									 description:"É o maior e mais movimentado galpão do Rio Grande do Sul")
	
	#Act
	visit(root_path)
	click_on("Salgado Filho")

	#Assert
	expect(page).to have_content("Nome: Salgado Filho")
	expect(page).to have_content("Galpão POA")
	expect(page).to have_content("Cidade: Porto Alegre")
	expect(page).to have_content("Área: 20000")
	expect(page).to have_content("Endereço: Av. Severo Dullius, 90.010 - RS, CEP: 90200-310")
	expect(page).to have_content("É o maior e mais movimentado galpão do Rio Grande do Sul")
	
	end
end