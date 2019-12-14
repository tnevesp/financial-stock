class Carteiras::EmAndamentosController < ApplicationController
	def index
		@carteiras = Carteira.joins(:empresa).where(situacao: 'em_andamento').order('empresas.ticker asc, carteiras.data_da_compra asc')
	end

	def concentrado
		@carteiras = Carteira.joins(:empresa).where(situacao: 'em_andamento').order('empresas.ticker asc, carteiras.data_da_compra asc')
	end
end