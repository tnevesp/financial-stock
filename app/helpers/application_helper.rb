module ApplicationHelper
	def is_active_controller(controller_name)
    params[:controller] == controller_name ? "active" : nil
  end

  def is_active_action(action_name)
    params[:action] == action_name ? "active" : nil
  end

  def number_to_currency_br(numero)
  	number_to_currency(numero, precision: 2, separator: ',', delimiter: ".", unit: 'R$ ', position: 'before', format: '%u%n')
  end

  def valor_do_rendimento_em_andamento
  	sql = %{select sum(entrada) as total_investido, sum(atual) as total_retornado from (select (entrada * quantidade) as entrada, (atual * quantidade) as atual from carteiras where situacao = 'em_andamento') as totais;}
  	resultado = ActiveRecord::Base.connection.execute(sql)

  	number_to_currency_br resultado.first['total_retornado'].to_f - resultado.first['total_investido'].to_f
  end

  def porcentagem_do_rendimento_em_andamento
  	sql = %{select sum(entrada) as total_investido, sum(atual) as total_retornado from (select (entrada * quantidade) as entrada, (atual * quantidade) as atual from carteiras where situacao = 'em_andamento') as totais;}
  	resultado = ActiveRecord::Base.connection.execute(sql)

  	"#{number_with_precision(((resultado.first['total_retornado'].to_f - resultado.first['total_investido'].to_f) / resultado.first['total_investido'].to_f) * 100.0, :precision => 2)}%"
  end

  def valor_do_rendimento_encerrado
  	sql = %{select sum(entrada) as total_investido, sum(atual) as total_retornado from (select (entrada * quantidade) as entrada, (atual * quantidade) as atual from carteiras where situacao = 'encerrado') as totais;}
  	resultado = ActiveRecord::Base.connection.execute(sql)

  	number_to_currency_br resultado.first['total_retornado'].to_f - resultado.first['total_investido'].to_f
  end

  def porcentagem_do_rendimento_encerrado
  	sql = %{select sum(entrada) as total_investido, sum(atual) as total_retornado from (select (entrada * quantidade) as entrada, (atual * quantidade) as atual from carteiras where situacao = 'encerrado') as totais;}
  	resultado = ActiveRecord::Base.connection.execute(sql)

  	"#{number_with_precision(((resultado.first['total_retornado'].to_f - resultado.first['total_investido'].to_f) / resultado.first['total_investido'].to_f) * 100.0, :precision => 2)}%"
  end
  
  def valor_do_rendimento_geral
  	sql = %{select sum(entrada) as total_investido, sum(atual) as total_retornado from (select (entrada * quantidade) as entrada, (atual * quantidade) as atual from carteiras) as totais;}
  	resultado = ActiveRecord::Base.connection.execute(sql)

  	number_to_currency_br resultado.first['total_retornado'].to_f - resultado.first['total_investido'].to_f
  end

  def porcentagem_do_rendimento_geral
  	sql = %{select sum(entrada) as total_investido, sum(atual) as total_retornado from (select (entrada * quantidade) as entrada, (atual * quantidade) as atual from carteiras) as totais;}
  	resultado = ActiveRecord::Base.connection.execute(sql)

  	"#{number_with_precision(((resultado.first['total_retornado'].to_f - resultado.first['total_investido'].to_f) / resultado.first['total_investido'].to_f) * 100.0, :precision => 2)}%"
  end
end
