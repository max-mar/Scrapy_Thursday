
require 'nokogiri'
require 'open-uri'

def get_the_currency(market_url)
	doc = Nokogiri::HTML(open(market_url))
	liste = Hash.new
	i = 0
	while i < doc.css("a.price").size
		liste[doc.xpath("/html/body/div[2]/div/div[1]/div[2]/div[3]/div[2]/table/tbody/tr[#{i}]/td[2]/a").text] = doc.xpath("/html/body/div[2]/div/div[1]/div[2]/div[3]/div[2]/table/tbody/tr[#{i}]/td[5]/a").text
		i += 1
	end
	print liste
end

get_the_currency("https://coinmarketcap.com/all/views/all/")