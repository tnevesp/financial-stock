class AtualizarPrecoManual
	def self.rodar
		valores.each do |ticker, valor|
			Carteira.joins(:empresa).where(empresas: { ticker: ticker }, carteiras: { situacao: 'em_andamento' }).update_all(atual: valor)
		end
	end

	def self.valores								
		[
			['ANIM3', 18.82],
			['CMIG4', 13.94],
			['DIRR3',  8.50],
			['GGBR4', 15.20],
			['ITUB4', 37.88],
			['LPSB3',  5.97],
			['MOVI3',  9.40],
			['MYPK3', 23.11],
			['PETR4', 24.85],
			['STBP3',  4.40],
			['TRIS3',  4.47],
			['USIM5',  9.87],
			['VALE3', 52.60],
			['VVAR3',  4.82]
		]	
	end
end

