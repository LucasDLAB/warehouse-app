class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show,:edit,:update]
  before_action :format_documentation, only: [:show]
  
  def index 
    @suppliers = Supplier.all
  end

  def show ; end
  
  def new 
    @supplier = Supplier.new()
  end

  def create 
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
			redirect_to suppliers_path, notice: "Fornecedor cadastrado com sucesso!"
		else 
			flash.now[:notice] = "Fornecedor não cadastrado."
			render :new
		end
  end

  def edit ; end

  def update
    if @supplier.update(supplier_params)
      redirect_to supplier_path(@supplier.id), notice: "Fornecedor atualizado com sucesso"
    else
      flash.now[:notice] = "Fornecedor não atualizado"
      render "edit"
    end
  end

  private
		def set_supplier
			@supplier = Supplier.find(params[:id])
		end

		def supplier_params
			params.require(:supplier).permit(:brand_name,:corporate_name,:phone,:full_address,
                                      :email,:registration_number)
		end

    def format_documentation
      @supplier = Supplier.find(params[:id])
      @supplier.registration_number.insert(2, ".")
      @supplier.registration_number.insert(6, ".")
      @supplier.registration_number.insert(10, "/")
      @supplier.registration_number.insert(15, "-")
    end
end