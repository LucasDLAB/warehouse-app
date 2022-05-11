require "rails_helper"

describe "Usuário acessa a página inicial de fornecedores" do
  it "a partir da tela inicial do sistema" do
    # Arrange
    Supplier.create!(brand_name:"Sony", corporate_name:"Sony Group Corporation", registration_number:"9278256900017", 
                    full_address:"Av das Palmas, 100" , email:"contato@sony.com", phone:"4003-2340")
    # Act
    visit root_path
    click_on "Fornecedores"
    # Assert
    expect(page).to have_content "Sony Group Corporation"
    expect(page).to have_content "Av das Palmas, 100"
  end

  it "sem Fornecedores cadastrados" do
    # Arrange

    # Act
    visit root_path
    click_on "Fornecedores"
    # Assert
    expect(page).to have_content "Não existem fornecedores cadastrados"
  end 
end

