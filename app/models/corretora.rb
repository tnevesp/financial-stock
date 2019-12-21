class Corretora < ApplicationRecord
	has_many :carteiras

	def xp?
		self.simbolo == 'XP'
	end

	def to_s
		nome
	end
end
