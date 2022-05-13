require "rails_helper"

describe "Usuário edita um fornecedor" do
  it "acessa o formulário de edição" do 
    # Arrange
    Supplier.create!(brand_name:"Sony",corporate_name:"Sony Corporation Group",registration_number:"7894563116249",
      email:"sac@sony.com",phone:"2345-3232", full_address:"Av das Flores, 1001")
    # Act
    visit root_path
    click_on "Fornecedores"
    click_on "Sony"
    click_on "Editar"

    # Assert
    expect(page).to have_field("Razão Social")
    expect(page).to have_field("Nome Fantasia")
    expect(page).to have_field("Número de registro")
    expect(page).to have_field("Email")
    expect(page).to have_field("Telefone")
    expect(page).to have_field("Endereço Completo")
  end

  it "com sucesso" do
    # Arrange
    Supplier.create!(brand_name:"Sony",corporate_name:"Sony Corporation Group",registration_number:"7894563116249",
      email:"sac@sony.com",phone:"2345-3232", full_address:"Av das Flores, 1001")

    # Act
    visit root_path
    click_on "Fornecedores"
    click_on "Sony"
    click_on "Editar"
    fill_in "Razão Social", with: "Samsung"
    fill_in "Nome Fantasia", with: "Samsung Corporation"
    fill_in "Número de registro", with: "7894563116248"
    fill_in "Email", with: "contato@samsung.com"
    fill_in "Telefone", with: "2345-3233"
    fill_in "Endereço Completo", with: "Rua dos Anjos, 1064"
    click_on "Atualizar Fornecedor"
    
    # Assert
    expect(page).to have_content "Fornecedor atualizado com sucesso"
    expect(page).to have_content "Samsung"
    expect(page).to have_content "Samsung Corporation"
    expect(page).to have_content "78.945.631/1624-8"
    expect(page).to have_content "contato@samsung.com"
    expect(page).to have_content "2345-3233"
    expect(page).to have_content "Rua dos Anjos, 1064"  
  end

  it "com dados incompletos" do 
    # Arrange
    Supplier.create!(brand_name:"Sony",corporate_name:"Sony Corporation Group",registration_number:"7894563116249",
      email:"sac@sony.com",phone:"2345-3232", full_address:"Av das Flores, 1001")

    # Act
    visit root_path
    click_on "Fornecedores"
    click_on "Sony"
    click_on "Editar"
    fill_in "Razão Social", with: ""
    fill_in "Nome Fantasia", with: ""
    fill_in "Número de registro", with: ""
    fill_in "Email", with: ""
    fill_in "Telefone", with: ""
    fill_in "Endereço Completo", with: ""
    click_on "Atualizar Fornecedor"
    
    # Assert
    expect(page).to have_content "Fornecedor não atualizado"
    expect(page).to have_content "Razão Social não pode ficar em branco"
    expect(page).to have_content "Nome Fantasia não pode ficar em branco"
    expect(page).to have_content "Número de registro não pode ficar em branco"
    expect(page).to have_content "Email não pode ficar em branco"
    expect(page).to have_content "Telefone não pode ficar em branco"
    expect(page).to have_content "Endereço Completo não pode ficar em branco"
    expect(page).to have_content "Número de registro não possui o tamanho esperado (13 caracteres)"
  end
end
