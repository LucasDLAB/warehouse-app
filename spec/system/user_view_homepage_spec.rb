require "rails_helper"

describe "Usuario visita a tela inicial" do
	it "e vê o nome da app" do
		# Arrange

		# Act
		visit("/")
		# Assert
		expect(page).to have_content("Sistema de Galpões e Estoque")

	end

	it "e vê a lista os galpões" do
		# Arrange
		Warehouse.create(name:"Rio", code:"SDU",city:"Rio de Janeiro",area:60_000)

		# Act
		visit("/")

		# Assert
		expect(page).to have_content("Rio")
		expect(page).to have_content("Código: SDU")
		expect(page).to have_content("Cidade: Rio de Janeiro")
		expect(page).to have_content("60000 m²")
	end
end