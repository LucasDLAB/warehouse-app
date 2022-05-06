class Warehouse < ApplicationRecord
	validates :name, presence: true
	validates :description, presence: true
	validates :cep, presence: true
	validates :area, presence: true
	validates :address, presence: true
	validates :state, presence: true
	validates :code, presence: true
	validates :city, presence: true
end
