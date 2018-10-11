require 'nokogiri'    
require 'open-uri'

def get_email_town(url)
doc = Nokogiri::HTML(open(url))
puts doc.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
end 

#get_email_town("http://annuaire-des-mairies.com/95/sagy.html")

def get_url_town
    doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    i = 0
    while i <= 184
    href = doc.css("a.lientxt")[i]["href"]
    href = href.sub(".", "http://annuaire-des-mairies.com")
 get_email_town(href)
    i += 1
    end
   # /html/body/table/tbody/tr[3]/td/table/tbody/tr/td[2]/p[2]/object/table/tbody/tr[2]/td/table/tbody/tr/td[2]/p/a[39]

end

get_url_town