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
  	sql = %{
      select sum(entrada) as total_investido, sum(atual) as total_retornado 
      from (
        select (c.entrada * c.quantidade) as entrada, (c.atual * c.quantidade) as atual 
        from carteiras c 
        inner join tipo_de_operacoes tp ON tp.id = c.tipo_de_operacao_id
        where c.situacao = 'em_andamento'
        and tp.nome = 'Compra'
        union all
        select (c.atual * c.quantidade) as entrada, (c.entrada * c.quantidade) as atual 
        from carteiras c 
        inner join tipo_de_operacoes tp ON tp.id = c.tipo_de_operacao_id
        where c.situacao = 'em_andamento'
        and tp.nome = 'Venda'
      ) as totais;
    }
  	resultado = ActiveRecord::Base.connection.execute(sql)

  	number_to_currency_br resultado.first['total_retornado'].to_f - resultado.first['total_investido'].to_f
  end

  def porcentagem_do_rendimento_em_andamento
  	sql = %{
        select sum(entrada) as total_investido, sum(atual) as total_retornado 
        from (
          select (c.entrada * c.quantidade) as entrada, (c.atual * c.quantidade) as atual 
          from carteiras c
          inner join tipo_de_operacoes tp ON tp.id = c.tipo_de_operacao_id
          where c.situacao = 'em_andamento'
          and tp.nome = 'Compra'
          union all
          select (c.atual * c.quantidade) as entrada, (c.entrada * c.quantidade) as atual 
          from carteiras c
          inner join tipo_de_operacoes tp ON tp.id = c.tipo_de_operacao_id
          where c.situacao = 'em_andamento'
          and tp.nome = 'Venda'
        ) as totais;
      }
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
