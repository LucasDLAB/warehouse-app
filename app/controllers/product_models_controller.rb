class ProductModelsController < ApplicationController
  def index
    @product_models = ProductModel.all
  end

  def new
    @product_model = ProductModel.new
    @supplier = Supplier.all
  end

  def create
    product_model_params = params.require(:product_model).permit(:name,:weight,:height,
                                          :width,:length,:sku,:supplier_id) 
    
    @product_model = ProductModel.new(product_model_params)

    if @product_model.save()
      redirect_to @product_model, notice: "Modelo cadastrado com sucesso"
    else
      @supplier = Supplier.all
      flash.now[:notice] = "Modelo não cadastrado"
      render "new"
    end

  end

  def show
    @product_model = ProductModel.find(params[:id])
  end
end