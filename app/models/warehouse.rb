class Warehouse < ApplicationRecord
	#presence
	validates :name, :city, :area, :address, :state, :cep, :description, :code, presence: true
	
	#uniqueness
	validates :name , :code, uniqueness: true
	
	#format
	validates :cep, format: {with:/\d{5}[-]\d{3}/}
	validates :state, format: {with:/[A-Z]{2}/}
	validates :code, format: {with: /[A-Z]{3}/}
	
	#length
	validates :cep, length: {is: 9}
	validates :state, length: {is: 2}
	validates :code, length: {is: 3}
end
