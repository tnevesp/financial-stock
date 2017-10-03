class Empresa < ApplicationRecord

	def to_s
		[self.ticker.upcase, self.nome].join(' - ')
	end
end