module Quote
#Hides API Key
KEY = ENV['QUOTES']


	#Quote API
	def self.quote(word)
		p KEY
		 uri = URI.parse("http://quotes.rest/quote.json?category=#{word}")
		 request = Net::HTTP::Get.new(uri)
		 request["X-Theysaidso-Api-Secret"] = "#{KEY}"

		 response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") do |http|
		 http.request(request)
		end
	end

end

#API Notes
# uri = URI.parse("http://quotes.rest/quote/categories.json?start=10000")


# uri = URI.parse("http://quotes.rest/qod.json?category=management")
# request = Net::HTTP::Get.new(uri)
# request["X-Theysaidso-Api-Secret"] = "OZ9h_QF4qQqshrnAlHG_wweF"

# response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") do |http|
#   http.request(request)
# end

#IF A QUOTE IS FOUND THIS IS THE WAY TO GRAB THE TEXT.
# conversion = JSON.parse(response.body)
# puts conversion["contents"]["quotes"][0]["quote"]
#ELSE 
#SEND NO CATEGORY FOUND TO USER
#send back no results found to the user.
#conversion["contents"]["quotes"].nil?


#10 RESPONSES
#academics
#adaptation
#afraid
#alive
#cautious
#celebrate
#embarrassing
#emotional	

