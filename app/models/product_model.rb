class ProductModel < ApplicationRecord
  belongs_to :supplier
  validates :name, :sku,:weight,:height,:length, :width, presence: true
  
  validates :sku, uniqueness:true

  validates :sku, length: {is:20}

  validates :weight,:height,:length, :width, numericality: {:greater_than => 0}

end
