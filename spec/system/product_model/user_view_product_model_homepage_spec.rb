require "rails_helper"

describe "Usuário acessa a tela inicial dos Modelos de Produto" do
  it "com sucesso" do
    supplier = Supplier.create!(brand_name:"Sony", corporate_name:"Sony Group Corporation",
                               registration_number:"9278256900017", full_address:"Av das Palmas, 100",
                               email:"contato@sony.com", phone:"4003-2340")

    ProductModel.create!(name:"TV 75", weight:45, height:120,
                        width:21 , length:34 , sku:"GGTV-BBAQX-PURO-0623", supplier:supplier)

    visit root_path
    within "nav" do
      click_on "Modelos de produto"
    end

    expect(page).to have_content "TV 75" 
    expect(page).to have_content "Fornecedor: Sony"
  end

  it "sem modelos cadastrados" do
    visit root_path
    click_on "Modelos de produto"

    expect(page).to have_content "Não possui modelos cadastrados" 
  end
end
