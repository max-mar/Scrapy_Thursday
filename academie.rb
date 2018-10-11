require 'nokogiri'
require 'open-uri'

def get_the_email_of_a_d(d_url)
	doc = Nokogiri::HTML(open(d_url))
	i = 2 ; e_mail = " "
	while e_mail.include?("@") == false && i < 8
		e_mail = doc.xpath("/html/body/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[#{i}]/ul/li[1]/a/@href").to_s.sub("mailto:", "")
		i += 1
	end
	return e_mail
end

def get_all_the_email(assembly_url)
	page = Nokogiri::HTML(open(assembly_url))
	i = 1 ; j = 0 ; n = 10
	liste = Hash.new
	while i <= 576
		nom = page.xpath("/html/body/div[3]/div/div/section/div/article/div[3]/div/table/tbody/tr[#{i}]/td[1]/a").text
		url = page.xpath("/html/body/div[3]/div/div/section/div/article/div[3]/div/table/tbody/tr[#{i}]/td[1]/a/@href")
		liste[nom] = get_the_email_of_a_d(url.to_s.sub("/", "http://www2.assemblee-nationale.fr/"))
		system 'clear'
		puts "              ...LOADING, PLEASE WAIT...                \n" + ("|"*j+" "*(58-j)+"|") + ("\n"+"|"*(n/10)+" "*(58-(n/10))+"|")
		if j == 58
			j = 0 
		end
		n += 1
		i += 1
		j += 1
	end
	puts liste
end

get_all_the_email("http://www2.assemblee-nationale.fr/deputes/liste/tableau")
