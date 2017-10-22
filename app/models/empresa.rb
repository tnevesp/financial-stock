class Empresa < ApplicationRecord
	has_many :carteiras

	def to_s
		[self.ticker.upcase, self.nome].join(' - ')
	end
end