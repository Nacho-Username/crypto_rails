class HomeController < ApplicationController
  BASE_URL = 'https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/listings/latest'
  API_SECRET_KEY = "5e4c208b-f863-45f1-887f-6819aae42893"

  def index
    @url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=#{API_SECRET_KEY}&start=1&limit=5000&convert=USD"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)
    @my_coins = ["BTC", "ETH", "BNB", "ADA"]
  end

  def about

  end

  def lookup
    @url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=#{API_SECRET_KEY}&start=1&limit=5000&convert=USD"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @look_up_coin = JSON.parse(@response)

    @symbol = params[:sym]
    if @symbol
      @symbol = @symbol.upcase
    end

    if @symbol == ""
      @symbol = "Please enter a crypto currency"
    end
  end

  def number_as_decimal(number, decimals)
    number_with_precision(number, precision: decimals)
  end
end
