class WarehousesController < ApplicationController
	def show
		@warehouse = Warehouse.find(params[:id])
	end

	def new
	end

	def create
		warehouse_params = params.require(:warehouse).permit(:name,:code,:city,:area,:address,
																												:cep,:description,:state)
		@w = Warehouse.new(warehouse_params)
		if @w.save
			return redirect_to root_path, notice: "Galpão cadastrado com sucesso!"
		else
			flash[:notice] = "É necessário preencher todos os campos"
			render :new
		end
	end
end