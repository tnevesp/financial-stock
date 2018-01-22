class AtualizarPrecoManual
	def self.rodar
		valores.each do |ticker, valor|
			Carteira.joins(:empresa).where(empresas: { ticker: ticker }, carteiras: { situacao: 'em_andamento' }).update_all(atual: valor)
		end
	end

	def self.valores								
		[
			['ELPL3', 15.87],
			['MDIA3', 51.50],
			['IRBR3', 37.50],
			['BKBR3', 17.75],
			['PETR4', 17.35],
			['BRKM5', 47.72],
			['MGLU3', 78.90],
			['PTBL3', 5.85],
			['EQTL3', 68.00],
			['ENEV3', 13.98],
			['BTOW3', 19.01],
			['SMLS3', 80.66],
			['PARD3', 31.74],
			['TEND3', 19.95],
			['HYPE3', 36.33],
			['MOVI3', 7.78],
			['FLRY3', 27.86],
			['RAPT4', 7.78]
		]	
	end
end

