class AtualizarPrecosJob < ApplicationJob
  queue_as :atualizar_precos

  def perform(*args)
    tickers = Carteira.where(situacao: 'em_andamento').map{ |c| c.empresa.ticker }.uniq
    unless tickers.blank?
    	resultados = YahooFinanceAPI.consulta(tickers.map{ |t| t + '.SA' })
    	resultados.each do |resultado|
    		symbol = resultado['symbol'].split('.').first
    		empresa = Empresa.where(ticker: symbol).first
    		empresa.carteiras.where(situacao: 'em_andamento').each do |carteira|
    			carteira.update(atual: resultado['LastTradePriceOnly'].to_f) unless resultado['LastTradePriceOnly'].blank?
    		end
    	end
    end
  end
end
