class AtualizacaoDePrecoService

  def self.executar
    tickers = Carteira.em_andamento.map{ |c| c.empresa.ticker }.uniq
    tickers.each do |ticker|
      #quote = GoogleFinance::Quote.get("#{ticker.upcase}.SA")
      quote = GoogleFinance::Prices.get("#{ticker.upcase}.SA")
      next if quote.blank?
      puts "*"*80
      puts "#{ticker.upcase} - #{quote.last.close}"
      puts "-+"*80
      Carteira.em_andamento.where_ticker(ticker.upcase).update(atual: quote.last.close) unless quote.last.blank?
    end
  end
end

# select t.nome, e.ticker, e.nome,
# c.data_da_compra, c.data_da_venda,
# c.entrada, c.atual, c.quantidade,
# (c.entrada * c.quantidade) as total_da_entrada,
# (c.atual * quantidade) as total_do_resgate,
# ((c.atual * c.quantidade) - (c.entrada * quantidade)) as diferenca
# from carteiras c
# inner join empresas e ON e.id = c.empresa_id 
# inner join tipo_de_operacoes t ON t.id = c.tipo_de_operacao_id
# where to_char(data_da_venda, 'MM/YYYY') = '02/2018'
# order by c.data_da_venda, c.data_da_compra, e.ticker;


# select sum(total_do_resgate) as total_movimentado, sum(diferenca) as lucro_ou_prejuizo from (
# 	select t.nome, e.ticker, e.nome,
# 	c.data_da_compra, c.data_da_venda,
# 	c.entrada, c.atual, c.quantidade,
# 	(c.entrada * c.quantidade) as total_da_entrada,
# 	(c.atual * quantidade) as total_do_resgate,
# 	((c.atual * c.quantidade) - (c.entrada * quantidade)) as diferenca
# 	from carteiras c
# 	inner join empresas e ON e.id = c.empresa_id 
# 	inner join tipo_de_operacoes t ON t.id = c.tipo_de_operacao_id
# 	where to_char(data_da_venda, 'MM/YYYY') = '10/2019'
# 	and t.nome = 'Compra'
# 	union all
# 	select t.nome, e.ticker, e.nome,
# 	c.data_da_compra, c.data_da_venda,
# 	c.entrada, c.atual, c.quantidade,
# 	(c.entrada * c.quantidade) as total_da_entrada,
# 	(c.atual * quantidade) as total_do_resgate,
# 	((c.entrada * quantidade) - (c.atual * c.quantidade)) as diferenca
# 	from carteiras c
# 	inner join empresas e ON e.id = c.empresa_id 
# 	inner join tipo_de_operacoes t ON t.id = c.tipo_de_operacao_id
# 	where to_char(data_da_venda, 'MM/YYYY') = '10/2019'
# 	and t.nome = 'Venda'
# ) as totais;



# select acao, ticker, nome_empresa, data_da_compra, data_da_venda, entrada, atual, quantidade, total_da_entrada, total_do_resgate, diferenca from (
# 	select t.nome as acao, e.ticker, e.nome as nome_empresa,
# 	c.data_da_compra, c.data_da_venda,
# 	c.entrada, c.atual, c.quantidade,
# 	(c.entrada * c.quantidade) as total_da_entrada,
# 	(c.atual * quantidade) as total_do_resgate,
# 	((c.atual * c.quantidade) - (c.entrada * quantidade)) as diferenca
# 	from carteiras c
# 	inner join empresas e ON e.id = c.empresa_id 
# 	inner join tipo_de_operacoes t ON t.id = c.tipo_de_operacao_id
# 	where to_char(data_da_venda, 'MM/YYYY') = '10/2019'
# 	and t.nome = 'Compra'
# 	union all 
# 	select t.nome as acao, e.ticker, e.nome as nome_empresa,
# 	c.data_da_compra, c.data_da_venda,
# 	c.entrada, c.atual, c.quantidade,
# 	(c.entrada * c.quantidade) as total_da_entrada,
# 	(c.atual * quantidade) as total_do_resgate,
# 	((c.entrada * quantidade) - (c.atual * c.quantidade)) as diferenca
# 	from carteiras c
# 	inner join empresas e ON e.id = c.empresa_id 
# 	inner join tipo_de_operacoes t ON t.id = c.tipo_de_operacao_id
# 	where to_char(data_da_venda, 'MM/YYYY') = '10/2019'
# 	and t.nome = 'Venda'
# ) as resultado
# order by data_da_venda, data_da_compra, ticker;










# select t.nome as acao, e.ticker, e.nome as nome_empresa,
#   c.data_da_compra, c.data_da_venda,
#   c.entrada, c.atual, c.quantidade,
#   (c.entrada * c.quantidade) as total_da_entrada,
#   (c.atual * quantidade) as total_do_resgate,
#   ((c.atual * c.quantidade) - (c.entrada * quantidade)) as diferenca
#   from carteiras c
#   inner join empresas e ON e.id = c.empresa_id 
#   inner join tipo_de_operacoes t ON t.id = c.tipo_de_operacao_id
#   where e.ticker = 'VALE3'
#   order by 4, 5










