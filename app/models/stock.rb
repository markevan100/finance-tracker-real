class Stock < ApplicationRecord

  def self.new_from_lookup(ticker_sym)
    begin
      looked_up = StockQuote::Stock.quote(ticker_sym)
      new(name: looked_up.company_name, ticker: looked_up.symbol, last_price: looked_up.latest_price)
    rescue Exception => e
      return nil
    end 
  end
end
