class Carteiras::EncerradasController < ApplicationController
	def index
		@carteiras = Carteira.encerradas.order(data_da_venda: :desc)
	end
end