require "rails_helper"

describe "Usuario cadastra um galpão" do
	it "a partir da tela inicial" do
		# Arrange

		# Act
		visit root_path
		click_on "Cadastrar Galpão"

		# Assert
		expect(page).to have_field("Nome", type:"text")
		expect(page).to have_field("Descrição", type:"textarea")
		expect(page).to have_field("Código", type:"text")
		expect(page).to have_field("Endereço", type:"text")
		expect(page).to have_field("Cidade", type:"text")
		expect(page).to have_field("CEP", type:"text")
		expect(page).to have_field("Estado", type: "text")
		expect(page).to have_field("Área", type:"number")
	end

	it "e com sucesso" do 
		# Arrange

		# Act
		visit root_path
		click_on "Cadastrar Galpão"
		fill_in "Nome", with: "Salgado Filho"
		fill_in "Descrição", with: "É o maior e mais movimentado galpão do Rio Grande do Sul"
		fill_in "Código", with: "POA"
		fill_in "Endereço", with: "Av. Severo Dullius"
		fill_in "Cidade", with: "Porto Alegre"
		fill_in "CEP", with: "90200-310"
		fill_in "Estado", with: "RS"
		fill_in "Área", with: "20000"
		click_on "Enviar"
		
		# Assert
		expect(current_path).to eql(root_path)
		expect(page).to have_content("Salgado Filho")
		expect(page).to have_content("POA")
		expect(page).to have_content("Porto Alegre")
		expect(page).to have_content("20000 m²")
	end

	it "com dados incompletos" do
		# Arrange

		# Act
		visit root_path
		click_on "Cadastrar Galpão"
		fill_in "Nome", with: ""
		fill_in "Descrição", with: ""
		click_on "Enviar"

		# Assert
		expect(page).to have_content "Galpão não cadastrado."
	end	
end
