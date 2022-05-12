require "rails_helper"

describe "Usuário cadastra um novo fornecedor" do
  it "a partir da tela inicial" do
    # Arrange
    
    # Act
    visit root_path
    click_on "Fornecedores"
    click_on "Cadastrar novo fornecedor"

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

    # Act
    visit root_path
    click_on "Fornecedores"
    click_on "Cadastrar novo fornecedor"
    fill_in "Razão Social",	with: "Sony"
    fill_in "Nome Fantasia", with:"Sony Corporation Group"
    fill_in "Número de registro", with: "7894563116249"
    fill_in "Email", with: "sac@sony.com"
    fill_in "Telefone", with: "2345-3232"
    fill_in  "Endereço", with: "Av das Flores, 1001"
    click_on "Criar Fornecedor"

    #Assert
    expect(current_path).to eql(suppliers_path)
    expect(page).to have_content "Fornecedor cadastrado com sucesso!"
    expect(page).to have_content "Sony Corporation Group"
    expect(page).to have_content "Av das Flores, 1001"
  end

  it "com formulário incompleto" do
    # Arrange

    # Act
    visit root_path
    click_on "Fornecedores"
    click_on "Cadastrar novo fornecedor"
    fill_in "Razão Social",	with: ""
    click_on "Criar Fornecedor"

    # Assert
    expect(page).to have_content "Fornecedor não cadastrado"
    expect(page).to have_content "Razão Social não pode ficar em branco"
    expect(page).to have_content "Nome Fantasia não pode ficar em branco"
    expect(page).to have_content "Número de registro não pode ficar em branco"
    expect(page).to have_content "Email não pode ficar em branco"
    expect(page).to have_content "Telefone não pode ficar em branco"
    expect(page).to have_content "Endereço Completo não pode ficar em branco"
    expect(page).to have_content "Número de registro não possui o tamanho esperado (13 caracteres)"

  end
end