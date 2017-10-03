# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find_or_initialize_by(email: 'tnevesp@gmail.com')
user.password = 'abc,123'
user.password_confirmation = 'abc,123'
user.confirmed_at = Date.today
user.save

empresa_ids = {}
[
	['BB SEGURIDADE', 'BBSE3'],
	['CIELO', 'CIEL3'],
	['ELETROBRAS', 'ELET3'],
	['EQUATORIAL', 'EQTL3'],
	['ITAUSA', 'ITSA3'],
	['PETROBRAS', 'PETR4'],
	['BANCO DO BRASIL', 'BBAS3'],
	['KROTON', 'KROT3'],
	['USIMINAS', 'USIM5'],
	['GOL', 'GOLL4'],
	['EMBRAER', 'EMBR3'],
	['JBS', 'JBSS3'],
	['GERDAU', 'GOAU4'],
	['VALE', 'VALE5'],
	['ELETROPAULO', 'ELPL4'],
	['SMILES', 'SMLE3'],
	['MOVIDA', 'MOVI3'],
	['B2W DIGITAL', 'BTOW3'],
	['TOTVS', 'TOTS3'],
	['NATURA', 'NATU3'],
	['CYRELA', 'CYRE3'],
	['IOCHP-MAXION', 'MYPK3'],
	['TUPY', 'TUPY3'],
	['PETRORIO', 'PRIO3'],
	['MULTIPLAN', 'MULT3'],
	['KLABIN', 'KLBN11'],
	['FLEURY', 'FLRY3'],
	['DIRECIONAL', 'DIRR3'],
	['SLC AGRICOLA', 'SLCE3'],
	['ITAU UNIBANCO', 'ITUB4'],
	['LOJAS RENNER', 'LREN3']
].each do |nome, ticker|
	empresa = Empresa.create(nome: nome, ticker: ticker)
	empresa_ids.merge!({ticker.downcase.to_sym => empresa.id})
end

# unless user.nil?
# 	{
# 		bbse3: { purchased_price: 35.20, purchased_at: '2015-05-04', quantity: 100, status: 'open' },
# 		ciel3: { purchased_price: 41.55, purchased_at: '2015-05-04', quantity: 100, status: 'open' },
# 		elet3: { purchased_price:  7.52, purchased_at: '2015-05-04', quantity: 100, sold_price: 8.56, sold_at: '2016-06-20', status: 'closed' },
# 		eqtl3: { purchased_price: 31.74, purchased_at: '2015-05-04', quantity: 100, status: 'open' },
# 		itsa3: { purchased_price:  9.60, purchased_at: '2015-05-05', quantity: 300, status: 'open' },
# 		petr4: { purchased_price:  4.49, purchased_at: '2016-02-04', quantity: 100, sold_price: 9.28, sold_at: '2016-06-20', status: 'closed' }
# 	}.each do |code, hash|
# 		puts carteira_ids
# 		carteira = { carteira_id: carteira_ids[code] }
		
# 		Wallet.create(hash.merge(carteira))
# 	end

# 	{
# 		petr4: { purchased_price:  4.60, purchased_at: '2016-02-18', quantity: 100, sold_price: 9.28, sold_at: '2016-06-20', status: 'closed' },
# 		bbse3: { purchased_price: 28.00, purchased_at: '2016-06-20', quantity: 100, status: 'open' },
# 		bbas3: { purchased_price: 17.05, purchased_at: '2016-07-01', quantity: 100, sold_price: 32.31, sold_at: '2017-03-20', status: 'closed' },
# 		krot3: { purchased_price: 14.30, purchased_at: '2016-07-01', quantity: 100, status: 'open' },
# 		usim5: { purchased_price:  3.02, purchased_at: '2016-07-26', quantity: 400, sold_price: 4.55, sold_at: '2017-03-17', status: 'closed' },
# 		goll4: { purchased_price:  6.69, purchased_at: '2016-09-22', quantity: 1000, sold_price: 5.25, sold_at: '2016-12-01', status: 'closed' },
# 		embr3: { purchased_price: 15.63, purchased_at: '2016-10-19', quantity: 400, sold_price: 16.87, sold_at: '2017-04-03', status: 'closed' }
# 	}.each do |code, hash|
# 		carteira = { carteira_id: carteira_ids[code] }
# 		Wallet.create(hash.merge(carteira))
# 	end

# 	{
# 		embr3: { purchased_price: 15.86, purchased_at: '2016-10-24', quantity: 600, sold_price: 16.87, sold_at: '2017-04-03', status: 'closed' },
# 		jbss3: { purchased_price: 10.05, purchased_at: '2016-11-08', quantity: 500, sold_price: 11.28, sold_at: '2017-03-06', status: 'closed' }
# 	}.each do |code, hash|
# 		carteira = { carteira_id: carteira_ids[code] }
# 		Wallet.create(hash.merge(carteira))
# 	end

# 	{
# 		jbss3: { purchased_price:  9.15, purchased_at: '2016-11-09', quantity: 500, sold_price: 11.28, sold_at: '2017-03-06', status: 'closed' },
# 		goau4: { purchased_price:  6.00, purchased_at: '2016-11-30', quantity: 1200, status: 'open' },
# 		petr4: { purchased_price: 16.03, purchased_at: '2016-11-30', quantity: 900, status: 'open' },
# 		vale5: { purchased_price: 26.49, purchased_at: '2016-12-01', quantity: 500, sold_price: 33.07, sold_at: '2017-02-22', status: 'closed' }
# 	}.each do |code, hash|
# 		carteira = { carteira_id: carteira_ids[code] }
# 		Wallet.create(hash.merge(carteira))
# 	end

# 	{
# 		elpl4: { purchased_price: 11.55, purchased_at: '2017-01-11', quantity: 1000, status: 'open' },
# 		smle3: { purchased_price: 48.55, purchased_at: '2017-01-18', quantity: 300, sold_price: 59.97, sold_at: '2017-02-08', status: 'closed' },
# 		movi3: { purchased_price:  7.30, purchased_at: '2017-02-08', quantity: 1000, sold_price: 7.37, sold_at: '2017-02-08', status: 'closed' },
# 		btow3: { purchased_price: 13.00, purchased_at: '2017-02-14', quantity: 1200, sold_price: 12.10, sold_at: '2017-02-23', status: 'closed' },
# 		tots3: { purchased_price: 26.76, purchased_at: '2017-03-06', quantity: 600, sold_price: 27.27, sold_at: '2017-03-13', status: 'closed' },
# 		natu3: { purchased_price: 27.49, purchased_at: '2017-03-10', quantity: 500, sold_price: 29.52, sold_at: '2017-04-27', status: 'closed' },
# 		cyre3: { purchased_price: 13.59, purchased_at: '2017-03-13', quantity: 1000, sold_price: 13.05, sold_at: '2017-03-20', status: 'closed' },
# 		mypk3: { purchased_price: 15.49, purchased_at: '2017-03-13', quantity: 1000, status: 'open' },
# 		tupy3: { purchased_price: 14.25, purchased_at: '2017-03-13', quantity: 1000, sold_price: 14.29, sold_at: '2017-04-04', status: 'closed' },
# 		prio3: { purchased_price: 41.00, purchased_at: '2017-03-29', quantity: 200, status: 'open' },
# 		mult3: { purchased_price: 68.20, purchased_at: '2017-04-05', quantity: 200, status: 'open' },
# 		klbn11: { purchased_price: 15.18, purchased_at: '2017-04-11', quantity: 1500, sold_price: 15.05, sold_at: '2017-04-11', status: 'closed' },
# 		flry3: { purchased_price: 44.32, purchased_at: '2017-04-13', quantity: 400, status: 'open', sold_price: 52.00, sold_at: '2017-04-28', status: 'closed' },
# 		vale5: { purchased_price: 26.46, purchased_at: '2017-04-13', quantity: 800, sold_price: 26.24, sold_at: '2017-04-13', status: 'closed' },
# 		dirr3: { purchased_price: 5.86, purchased_at: '2017-04-17', quantity: 2000, status: 'open' }
# 		lren3: { purchased_price: 29.70, purchased_at: '2017-05-02', quantity: 600, status: 'open' }
# 		itub4: { purchased_price: 39.86, purchased_at: '2017-05-02', quantity: 400, status: 'open' }
# 	}.each do |code, hash|
# 		carteira = { carteira_id: carteira_ids[code] }
# 		Wallet.create(hash.merge(carteira))
# 	end

# 	{
# 		slce3: { purchased_price: 18.45, purchased_at: '2017-04-19', quantity: 600, status: 'open' },
# 		dirr3: { purchased_price: 5.79, purchased_at: '2017-04-20', quantity: 1300, status: 'open' }
# 	}.each do |code, hash|
# 		carteira = { carteira_id: carteira_ids[code] }
# 		Wallet.create(hash.merge(carteira))
# 	end
# end
