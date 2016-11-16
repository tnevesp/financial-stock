# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.where(email: 'tnevesp@gmail.com').first
unless user.nil?
	[
		['GOL', 'GOLL4', 6.71, '2016-09-22', 1000],
		['EMBRAER', 'EMBR3', 15.64, '2016-10-19', 400],
		['EMBRAER', 'EMBR3', 15.86, '2016-10-24', 600],
		['JBS', 'JBSS3', 10.05, '2016-11-08', 500],
		['JBS', 'JBSS3', 9.15, '2016-11-09', 500],
		['USIMINAS', 'USIM5', 3.02, '2016-07-26', 400],
		['BB SEGURIDADE', 'BBSE3', 35.21, '2015-05-04', 100],
		['BB SEGURIDADE', 'BBSE3', 28.0, '2016-06-20', 100],
		['BANCO DO BRASIL', 'BBAS3', 17.05, '2016-07-01', 100],
		['CIELO', 'CIEL3', 41.55, '2015-05-04', 100],
		['EQUATORIAL', 'EQTL3', 31.74, '2015-05-04', 100],
		['ITAUSA', 'ITSA3', 9.60, '2015-05-04', 300],
		['KROTON', 'KROT3', 14.30, '2016-07-01', 100]
	].each do |name, code, purchased_price, purchased_at, quantity|
		paper = Paper.find_or_create_by(name: name, code: code)
		Wallet.find_or_create_by(purchased_price: purchased_price, purchased_at: purchased_at, paper_id: paper.id, quantity: quantity)
	end
end
