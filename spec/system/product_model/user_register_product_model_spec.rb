require "rails_helper"

describe "Usuário cadastra um novo modelo de produto" do
	it "a partir da tela inicial" do 

		visit root_path
	  click_on "Modelos de produto"
	  click_on "Cadastrar novo modelo"

	  expect(page).to have_field("Nome", type: "text")
	  expect(page).to have_field("Peso", type: "number")
	  expect(page).to have_field("Altura", type: "number")
	  expect(page).to have_field("Largura", type: "number")
	  expect(page).to have_field("Comprimento", type: "number")   
	  expect(page).to have_field("SKU", type: "text")
	  expect(page).to have_field("Fornecedor", type: "select")
	end

	it "com sucesso" do
		supplier = Supplier.create!(brand_name:"Sony", corporate_name:"Sony Group Corporation",
															 registration_number:"9278256900017", full_address:"Av das Palmas, 100", 
                               email:"contato@sony.com", phone:"4003-2340")

		another_supplier = Supplier.create!(brand_name:"Samsung", corporate_name:"Sony Group Corporation",
															 registration_number:"9278256900016", full_address:"Av das Palmas, 100", 
                               email:"contato@sony.com", phone:"4003-2340")

    visit root_path
    click_on "Modelos de produto"
    click_on "Cadastrar novo modelo"
    fill_in "Nome", with: "TV 75"
		fill_in "Peso", with: 45
		fill_in "Altura", with: 120 
		fill_in "Largura", with: 21
		fill_in "Comprimento", with: 34
		fill_in "SKU", with: "GGTV-BBAQX-PURO-0623"
		select "Sony", from: "Fornecedor" 
		click_on "Enviar"

		expect(page).to have_content "Modelo cadastrado com sucesso"
    expect(page).to have_content "TV 75"
    expect(page).to have_content "45"
    expect(page).to have_content "120cm x 21cm x 34cm"
    expect(page).to have_content "GGTV-BBAQX-PURO-0623"
    expect(page).to have_content "Sony"
	end

	it "com dados incompletos" do
		supplier = Supplier.create!(brand_name:"Sony", corporate_name:"Sony Group Corporation",
															 registration_number:"9278256900017", full_address:"Av das Palmas, 100", 
                               email:"contato@sony.com", phone:"4003-2340")

		another_supplier = Supplier.create!(brand_name:"Samsung", corporate_name:"Sony Group Corporation",
															 registration_number:"9278256900016", full_address:"Av das Palmas, 100", 
                               email:"contato@sony.com", phone:"4003-2340")

    visit root_path
    click_on "Modelos de produto"
    click_on "Cadastrar novo modelo"
    fill_in "Nome", with: ""
		fill_in "SKU", with: ""
		select "Sony", from: "Fornecedor" 
		click_on "Enviar"

		expect(page).to have_content "Modelo não cadastrado"
		expect(page).to have_content "Nome não pode ficar em branco"
    expect(page).to have_content "SKU não pode ficar em branco"
    expect(page).to have_content "Peso não pode ficar em branco"
    expect(page).to have_content "Altura não pode ficar em branco"
    expect(page).to have_content "Comprimento não pode ficar em branco"
    expect(page).to have_content "Largura não pode ficar em branco"
    expect(page).to have_content "SKU não possui o tamanho esperado (20 caracteres)"
    expect(page).to have_content "Peso não é um número"
    expect(page).to have_content "Altura não é um número"
    expect(page).to have_content "Comprimento não é um número"
    expect(page).to have_content "Largura não é um número"
	end
end