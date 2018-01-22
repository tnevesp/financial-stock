class AtualizarPrecosJob < ApplicationJob
  queue_as :atualizar_precos

  def perform(*args)
    tickers = Carteira.where(situacao: 'em_andamento').map{ |c| c.empresa.ticker }.uniq
    unless tickers.blank?
        puts "*"*80
        puts tickers.map{ |t| t + '.SA' }
        puts "*"*80

    	resultados = YahooFinanceAPI.consulta(tickers.map{ |t| t + '.SA' })
    	resultados.each do |resultado|
    		symbol = resultado['symbol'].split('.').first
    		empresa = Empresa.where(ticker: symbol).first
    		empresa.carteiras.where(situacao: 'em_andamento').each do |carteira|
    			unless resultado['LastTradePriceOnly'].blank?
    				carteira.update(atual: resultado['LastTradePriceOnly'].to_f)
    			else
    				puts "*"*80
    				puts "#{resultado['symbol']} não atualizou"
    				puts "*"*80
    			end
    		end
    	end
    end
  end
end
