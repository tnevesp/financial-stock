require 'rest-client'

class YahooFinanceAPI
  API_URL = 'http://query.yahooapis.com/v1/public/yql'

  def self.consulta(tickers, fields=true)
    if tickers.is_a?(Array)
      tickers = tickers.join(',')
    end

    url = API_URL
    url += '?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20%28%22' + tickers + '%22%29&env=store://datatables.org/alltableswithkeys'

    if fields == true || fields.blank?
        fields = [
                'Symbol','Name','Change','ChangeRealtime','PERatio',
                'PERatioRealtime','Volume','PercentChange','DividendYield',
                'LastTradeRealtimeWithTime','LastTradeWithTime','LastTradePriceOnly','LastTradeTime',
                'LastTradeDate'
                ]
    end
puts url
    response = RestClient.get url
    Hash.from_xml(response.body)['query']['results']['quote']
  end
end