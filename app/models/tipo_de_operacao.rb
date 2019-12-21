class TipoDeOperacao < ApplicationRecord
	has_many :carteiras

	def compra?
		self.nome.underscore.to_sym == :compra
	end

	def letra
		return 'C' if compra?
		'V'
	end

	def to_s
		nome
	end
end
